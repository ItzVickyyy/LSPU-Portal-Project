const { getSupabaseAdmin, getSupabasePublic } = require('../_lib/supabase');

function email(v){return String(v||'').trim().toLowerCase();}
function text(v){return String(v||'').trim();}

module.exports = async function handler(req,res){
  if(req.method!=='POST') return res.status(405).json({ok:false,msg:'Method not allowed.'});
  try{
    const e=email(req.body?.email), first=text(req.body?.first_name), middle=text(req.body?.middle_name), last=text(req.body?.last_name), suffix=text(req.body?.suffix), password=String(req.body?.password||''), confirm=String(req.body?.confirm||'');
    if(!e||!first||!last||password.length<6||password!==confirm) return res.status(400).json({ok:false,msg:'Please provide valid registration details.'});
    const db=getSupabaseAdmin();

    const {data:admin}=await db.from('admins').select('admin_id').eq('email',e).maybeSingle();
    if(admin) return res.status(400).json({ok:false,msg:'This email is reserved for staff.'});
    const {data:existing}=await db.from('applicants').select('id').eq('Email',e).maybeSingle();
    if(existing) return res.status(400).json({ok:false,msg:'Email is already registered.'});

    const {data:otp,error:oe}=await db.from('portal_otps').select('id').eq('purpose','register').eq('email',e).not('verified_at','is',null).order('verified_at',{ascending:false}).limit(1).maybeSingle();
    if(oe) throw oe;
    if(!otp) return res.status(400).json({ok:false,msg:'Please verify the registration OTP first.'});

    const {data:user,error:ue}=await db.auth.admin.createUser({email:e,password,email_confirm:true});
    if(ue) throw ue;

    const {data:applicant,error:ae}=await db.from('applicants').insert({
      Email:e,password_hash:null,application_status:'Draft',
      First_Name:first,Middle_Name:middle||null,Last_Name:last,Suffix:suffix||null
    }).select('id').single();
    if(ae){await db.auth.admin.deleteUser(user.id);throw ae;}

    const {error:me}=await db.from('portal_users').insert({id:user.id,account_type:'applicant',applicant_id:applicant.id});
    if(me){await db.from('applicants').delete().eq('id',applicant.id);await db.auth.admin.deleteUser(user.id);throw me;}

    const pub=getSupabasePublic();
    const {data:session,error:se}=await pub.auth.signInWithPassword({email:e,password});
    if(se) throw se;

    return res.json({ok:true,msg:'Registration successful.',access_token:session.session.access_token,refresh_token:session.session.refresh_token,applicant_id:applicant.id,redirect:'../applicant/applicant_profile.html'});
  }catch(error){
    console.error('Registration error:',error);
    return res.status(500).json({ok:false,msg:'Registration failed.'});
  }
};
