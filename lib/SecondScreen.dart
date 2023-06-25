

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:peckes_play/profileScreen.dart';

import 'package:rive/rive.dart';


class SecondScreen extends StatefulWidget{
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

Future<FirebaseApp> _initializafirebase() async{
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  return firebaseApp;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
      body: FutureBuilder(
        future: _initializafirebase(),
        builder: (context, snapshot){
          if( snapshot.connectionState== ConnectionState.done){
            return Login();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }
}
class Login extends StatefulWidget{
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();

}
class LoginState extends State<Login>{
  static Future<User?> loginUsingEmailPassword({ required String email,required String password, required BuildContext context}) async{
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  try{
    UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
    user = userCredential.user;
  } on  FirebaseAuthException catch(e){
    if(e.code =="user-not-found"){
      print("Usuario no encontrado");
  }
  }
  return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: new AssetImage('assets/img/1.png'), fit: BoxFit.cover,),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children:<Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 340,
                        height: 300,
                        margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: SingleChildScrollView(

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 0.0, bottom: 5.0),
                                child: const Text("Inicio de sesion", style: TextStyle(
                                  color: Color(0xff3914AF),
                                  fontFamily: "Fredoka One",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.0,
                                ),),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 0.0, bottom: 5.0),
                                child: TextField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  enableInteractiveSelection: true,
                                  decoration: const InputDecoration(
                                      icon: Icon(Icons.email),
                                      hintText: 'email',
                                      labelText: 'Correo electronico'
                                  ),
                                  onChanged: (value){

                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 0.0, bottom: 10.0),
                                child: TextField(
                                  controller: _passController   ,
                                  keyboardType: TextInputType.visiblePassword,
                                  enableInteractiveSelection: true,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      icon: Icon(Icons.password),
                                      hintText: 'Contraseña',
                                      labelText: 'Contraseña'
                                  ),
                                  onChanged: (value){

                                  },
                                ),
                              ),
                              Container(
                                width: 170,
                                height: 60,
                                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                                child: ElevatedButton(
                                  onPressed: ( ) async{
                                    User? user= await loginUsingEmailPassword(email: _emailController.text, password: _passController.text, context: context);
                                    print(user);
                                    if (user != null){
                                      Navigator.pushNamed(  context, 'games');
                                    }else{
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(

                                      primary: Colors.white,
                                      onPrimary: Color(0xff3914AF),
                                      shadowColor: Colors.black54,

                                      elevation: 10
                                  ),
                                  child: const Text('Iniciar Sesion'),
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text("Aun no tienes cuenta?", style: TextStyle(
                                        color: Color(0xff3914AF),
                                        fontFamily: "Fredoka One",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                      ),),
                                      Text("Registrate", style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Fredoka One",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),),
                                    ],
                                  )
                              )
                            ],
                          ),
                        )
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 350,
                        height: 400,

                        child: const RiveAnimation.asset('assets/img/globos.riv')
                    )
                  ],
                )
              ]
          )
        ],
      ),
    );
    throw UnimplementedError();
  }


  }
