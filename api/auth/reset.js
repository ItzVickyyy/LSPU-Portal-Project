const { getSupabaseAdmin, getSupabasePublic } = require('../_lib/supabase');

function email(v){return String(v||'').trim().toLowerCase();}
module.exports=async function handler(req,res){
 if(req.method!=='POST')return res.status(405).json({ok:false,msg:'Method not allowed.'});
 try{
  const e=email(req.body?.email),password=String(req.body?.password||''),confirm=String(req.body?.confirm||'');
  if(!e||password.length<6||password!==confirm)return res.status(400).json({ok:false,msg:'Invalid password details.'});
  const db=getSupabaseAdmin();
  const {data:otp,error:oe}=await db.from('portal_otps').select('id').eq('purpose','reset').eq('email',e).not('verified_at','is',null).order('verified_at',{ascending:false}).limit(1).maybeSingle();
  if(oe)throw oe;
  if(!otp)return res.status(400).json({ok:false,msg:'Please verify the reset OTP first.'});
  const {data:users,error:ue}=await db.auth.admin.listUsers({page:1,perPage:1000});
  if(ue)throw ue;
  const user=(users.users||[]).find(u=>(u.email||'').toLowerCase()===e);
  if(!user)return res.status(400).json({ok:false,msg:'Account not found.'});
  const {error:pe}=await db.auth.admin.updateUserById(user.id,{password,email_confirm:true});
  if(pe)throw pe;
  return res.json({ok:true,msg:'Password reset successfully.'});
 }catch(error){console.error('Reset error:',error);return res.status(500).json({ok:false,msg:'Password reset failed.'});}
};
