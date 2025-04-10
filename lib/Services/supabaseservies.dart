import 'package:supabase_flutter/supabase_flutter.dart';

 class SupabaseServices {
   final supabase = Supabase.instance.client;

    Future <int> getusercount()async{
      final response = await supabase
    .from('users')
    .select().count(CountOption.exact);
    return response.count;
     
   }
 adduser(String phone, String name)async{
    int count = await getusercount();
    int id = count+1;
    await supabase
    .from('users')
    .insert({'name': name, 'phone': phone, 'current_session': 0,  'id': id});

   }
   Future<bool> isuserexist(String phone)async{
    final response = await supabase
    .from('users')
    .select().eq('phone', phone);
    return response.isNotEmpty;
   
   }
   Future <int> getcurrentsession(String phone)async{
    return  await supabase
    .from('users')
    .select('current_session').eq('phone', phone).single() 
    .then((value) => value['current_session'] as int);

   }
   Future<void> updatecurrentsession(String phone, int session)async{
    await supabase
    .from('users')
    .update({'current_session': session}).eq('phone', phone);
   }
    addnewsession(String phone, int session)async{
    await supabase
    .from('users')
    .update({'current_session': session}).eq('phone', phone);
    
   }
   
  // getallusers()async{
  //   final response = await supabase
  //   .from('users')
  //   .select();
  //   return response as List<usermodel>;
  //  }
   
 }
