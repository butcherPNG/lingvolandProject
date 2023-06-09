import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linguasphere/presentation/responsive/main_page_desktop.dart';
import 'package:linguasphere/widgets/appBar.dart';
import 'package:linguasphere/widgets/footer.dart';
import 'package:linguasphere/widgets/questions.dart';
import 'package:intl/intl.dart';
import '../styles/styles.dart';
import '../widgets/panel.dart';



class LessonsPage extends StatefulWidget {



  @override
  _LessonsPageState createState() => _LessonsPageState();
}


class _LessonsPageState extends State<LessonsPage> {
  bool isTeacher = false;
  String name = '';
  String date = '';
  String time = '';
  String homework = '';
  Future<bool> checkPermissions() async {
    if(FirebaseAuth.instance.currentUser != null){
      await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value){
        value['role'] == 'teacher' ? isTeacher = true : isTeacher = false;
      });

    }else{
      isTeacher = false;
    }


    return isTeacher;
  }



  @override
  void initState() {


    super.initState();
  }
  bool loaded = false;
  List lessons = [];
  List<dynamic> list = [];
  Future<void> getLessons(String id,) async {
    await FirebaseFirestore.instance.collection('groups').doc(id).collection('lessons').get().then((value){
      value.docs.forEach((element) {
        lessons.add(element);
      });



    });

  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: checkPermissions(),
        builder: (context, snap){
          if(snap.connectionState == ConnectionState.done){
            return LayoutBuilder(
                builder: (context, screen){
                  if(screen.maxWidth < 1200 && screen.maxWidth > 601){
                    return Container();
                  }else if(screen.minWidth <= 600){
                    return Container();
                  }else{
                    return Scaffold(
                      appBar: myAppBar(),
                      body: isTeacher == true ?
                      StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('groups').snapshots(),
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snap){
                            if(snap.hasData){
                              var groups = snap.data!.docs.where((doc) =>
                              doc.get('teacher') == FirebaseAuth.instance.currentUser!
                                  .email).toList();
                              return ListView(
                                children: [
                                  SizedBox(height: 80,),
                                  Center(
                                    child: Container(
                                      width: 1200,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          niceContainer(
                                              child: SizedBox(
                                                width: 526,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Информация о следующием занятии', style: subHeaderTxt(size: 40),),
                                                    SizedBox(height: 38,),
                                                    button(onClick: (){addNewInfo(context, screen.maxWidth, groups);}, text: 'Добавить', width: 257, height: 45)
                                                  ],
                                                ),
                                              ),
                                              screen: screen.maxWidth
                                          ),
                                          niceContainer(
                                              child: SizedBox(
                                                width: 348,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Создать новую группу', style: subHeaderTxt(size: 40),),
                                                    SizedBox(height: 38,),
                                                    button(onClick: (){addNewGroup(context, screen.maxWidth);}, text: 'Создать', width: 257, height: 45)
                                                  ],
                                                ),
                                              ),
                                              screen: screen.maxWidth
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  margin_top(screen.maxWidth),
                                  Center(
                                    child: Container(
                                      width: 1200,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 692,
                                            child: SelectableText(
                                              'Мои группы', style: headerTxt(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 80,),
                                  Center(
                                    child: SizedBox(
                                      width: 1200,
                                      child: GridView.builder(
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 20.0,
                                          crossAxisSpacing: 20.0,
                                          childAspectRatio: 387 / 264,
                                        ),
                                        shrinkWrap: true,
                                        itemCount: groups.length,
                                        itemBuilder: (context, index){
                                          return niceContainer(
                                              child: SizedBox(
                                                width: 323,
                                                height: 200,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            SizedBox(width: 20,),
                                                            Tooltip(
                                                              message: 'Настройки группы',
                                                              child: InkResponse(
                                                                onTap: (){},
                                                                child: Icon(Icons.settings, size: 20, color: dark,),
                                                              ),
                                                            )

                                                          ],
                                                        ),
                                                        SizedBox(width: 6,),
                                                        Text('Группа ${groups[index]['name']}', maxLines: 2, overflow: TextOverflow.ellipsis, style: subHeaderTxt(size: 40),),
                                                      ],

                                                    ),

                                                    button(onClick: (){
                                                      addNewStudent(context, groups[index]['id'], groups[index]['name'], screen.maxWidth);
                                                    }, text: 'Добавить ученика', width: 323, height: 45)
                                                  ],
                                                ),
                                              ),
                                              screen: screen.maxWidth);
                                        },

                                      ),
                                    ),
                                  )
                                ],
                              );
                            }else{
                              return ListView(
                                children: [

                                ],
                              );
                            }
                          }
                      )
                      : StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('groups').snapshots(),
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snap){
                            if (snap.hasData){
                              var groups = snap.data!.docs.where((doc) =>
                                  (doc.get('students') as List<dynamic>).any((student) => student['email'] == FirebaseAuth.instance.currentUser!.email)
                              ).toList();

                              if(groups.isNotEmpty && loaded == false){
                                List<Future<void>> futures = [];
                                for(int i = 0; i < groups.length; i++) {
                                  futures.add(getLessons(groups[i]['id']));
                                }
                                Future.wait(futures).then((value){
                                  if(lessons.isNotEmpty){
                                    setState(() {
                                      loaded = true;
                                      list = List.from(lessons);
                                      DateTime now = DateTime.now();

                                      list.sort((a, b) {
                                        DateTime aDate = DateFormat('dd.MM.yyyy HH:mm').parse('${a['date']} ${a['time']}');
                                        DateTime bDate = DateFormat('dd.MM.yyyy HH:mm').parse('${b['date']} ${b['time']}');
                                        return aDate.compareTo(bDate);
                                      });

                                      list.removeWhere((element) {
                                        DateTime elementDate = DateFormat('dd.MM.yyyy HH:mm').parse(element['date'] + ' ' + element['time']);
                                        return elementDate.isBefore(now);
                                      });
                                    });
                                  }
                                });
                              }


                                return ListView(

                                  children: [
                                    SizedBox(height: 60,),
                                    Center(
                                      child: Container(
                                        width: 1200,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 800,
                                              child: SelectableText(
                                                'Предстоящие занятия', style: headerTxt(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 40,),
                                    Center(
                                      child: Container(
                                          width: 1200,
                                          child: GridView.builder(
                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 20.0,
                                                crossAxisSpacing: 20.0,
                                                childAspectRatio: 590 / 299,
                                              ),
                                              shrinkWrap: true,
                                              itemCount: list!.length,
                                              itemBuilder: (context, index){
                                                return niceContainer(
                                                    child: SizedBox(
                                                      width: 526,
                                                      height: 235,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text('Группа ${list![index]['name']}', style: subHeaderTxt(size: 40),),
                                                              SizedBox(height: 18,),
                                                              Text('Домашнее задание: ${list[index]['hw']}', style: blockTxt(),),
                                                            ],
                                                          ),
                                                          Text('Следующее занятие ${list[index]['date']} в ${list[index]['time']}', style: blockTxt(color: Color(0xff9B9B9B)),),
                                                        ],
                                                      ),
                                                    ),
                                                    screen: screen.maxWidth
                                                );
                                              }
                                          )
                                      ),
                                    ),


                                  ],
                                );


                            }else{
                              return Container();
                            }
                          }
                      )

                    );
                  }
                }
            );
          }else{
            return Scaffold(
              appBar: myAppBar(),
              body: Center(child: CircularProgressIndicator(),),
            );
          }
        }
    );
  }


}
TextEditingController emailController = TextEditingController();
TextEditingController groupNameController = TextEditingController();
final GlobalKey<FormState> formKeyStudent = GlobalKey<FormState>();
final GlobalKey<FormState> formKeyGroup = GlobalKey<FormState>();
final GlobalKey<FormState> formKeyInfo = GlobalKey<FormState>();
addNewStudent(BuildContext context, String id, String name, double screen) async {
  await showDialog(
      context: context,
      builder: (BuildContext context){
        return Dialog(
          child: niceContainer(
              child: SizedBox(
                width: 220,
                height: 300,
                child: Form(
                  key: formKeyStudent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 220,
                        child: Text('Добавить в группу $name', style: subHeaderTxt(size: 24),),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: 220,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(0xFFDFDFDF), width: 1),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                offset: Offset(0, 4),
                                blurRadius: 16,
                              )
                            ]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            validator: (v){
                              final RegExp emailRegex = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
                              );
                              if (emailRegex.hasMatch(v!) == false){
                                return 'Введите корректный E-mail';
                              }
                              if (v.trim().isEmpty){
                                return 'Это поле не может быть пустым';
                              }
                            },
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'Email ученика',
                              hintStyle: navTxt(fontSize: 16, weight: FontWeight.w500, color: Color(0xffC6C6C6)),
                              contentPadding: EdgeInsets.only(left: 8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide.none,
                              ),
                              hoverColor: Colors.transparent,
                            ),

                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      SizedBox(
                        width: 220,
                        height: 60,
                        child: button(
                            onClick: () async {
                              if(formKeyStudent.currentState!.validate() == true){
                                var doc = await FirebaseFirestore.instance.collection('groups').doc(id).get();
                                var list = doc.data()!['students'];
                                print('Old list: $list');
                                list.add({'email': emailController.text});
                                print('New list: $list');

                                await FirebaseFirestore.instance.collection('groups').doc(id).update({
                                  'students': list,
                                }).then((value) {
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text(
                                            'Ученик ${emailController.text} успешно добавлен в группу $name!')),
                                  );
                                });

                              }
                            },
                            text: 'Добавить'
                        ),
                      )
                    ],
                  ),
                ),
              ),
              screen: screen
          ),
        );
      }
  );

  emailController.clear();
}

addNewGroup(BuildContext context, double screen) async {
  await showDialog(
  context: context,
  builder: (BuildContext context){
    return Dialog(
      child: niceContainer(
          child: SizedBox(
            width: 220,
            height: 300,
            child: Form(
              key: formKeyGroup,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 220,
                    child: Text('Создать новую группу', style: subHeaderTxt(size: 24),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 220,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFDFDFDF), width: 1),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            offset: Offset(0, 4),
                            blurRadius: 16,
                          )
                        ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        validator: (v){
                          if (v!.trim().isEmpty){
                            return 'Это поле не может быть пустым';
                          }
                        },
                        controller: groupNameController,
                        decoration: InputDecoration(
                          hintText: 'Имя группы',
                          hintStyle: navTxt(fontSize: 16, weight: FontWeight.w500, color: Color(0xffC6C6C6)),
                          contentPadding: EdgeInsets.only(left: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide.none,
                          ),
                          hoverColor: Colors.transparent,
                        ),

                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: 220,
                    height: 60,
                    child: button(
                        onClick: () async {
                          if(formKeyGroup.currentState!.validate() == true){
                            var id = FirebaseFirestore.instance.collection('groups').doc().id;
                            await FirebaseFirestore.instance.collection('groups').doc(id).set({
                              'id': id,
                              'name': groupNameController.text,
                              'teacher': FirebaseAuth.instance.currentUser!.email,
                              'students': [],
                            }).then((value){
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text(
                                        'Группа ${groupNameController.text} успешно создана!')),
                              );
                            });

                          }
                        },
                        text: 'Создать'
                    ),
                  )
                ],
              ),
            ),
          ),
          screen: screen
      ),
    );
  }
  );


  groupNameController.clear();
}

addNewInfo(BuildContext context, double screen, List groups) async {
  await showDialog(
  context: context,
  builder: (BuildContext context){
    return Dialog(
      child: niceContainer(
          child: SizedBox(
            width: 280,
            height: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Группы', style: subHeaderTxt(size: 24),),
                SizedBox(height: 16,),
                SizedBox(
                  width: 280,
                  height: 400,
                  child: ListView.builder(
                    itemCount: groups.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        leading: Text('${index + 1}.', style: subHeaderTxt(size: 20),),
                        title: Text('${groups[index]['name']}', style: subHeaderTxt(size: 18),),
                        onTap: (){setNewInfo(context, screen, groups[index]['name'], groups[index]['id']);},
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          screen: screen
      ),
    );
  }
  );
}

class DatePick extends StatefulWidget {
  final String name;
  final String id;
  final double screen;
  const DatePick({
    super.key,
    required this.screen,
    required this.name,
    required this.id,
  });

  @override
  State<DatePick> createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  TextEditingController infoController = TextEditingController();
  TextEditingController hwController = TextEditingController();
  showDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate == null ? DateTime.now() : selectedDate!,
        firstDate: DateTime.now(),
        lastDate: DateTime.utc(DateTime.now().year, 12)
    );
    if(picked != null){
      setState(() {
        selectedDate = picked;
      });
    }

  }
  showTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime ?? TimeOfDay(hour: 9, minute: 0),

    );
    if(pickedTime != null){
      setState(() {
        selectedTime = pickedTime;
      });
    }

  }
  String to24hours(TimeOfDay selectedTime) {
    final hour = selectedTime.hour.toString().padLeft(2, "0");
    final min = selectedTime.minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
  setInfo(BuildContext ctx)async{

    if(formKeyInfo.currentState!.validate()){
      await FirebaseFirestore.instance.collection('groups').doc(widget.id).collection('lessons').doc().set({
        'name': widget.name,
        'date': format.format(selectedDate!).toString() ?? '',
        'time': to24hours(selectedTime!) ?? '',
        'hw': hwController.text
      }).then((value){
        ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                  'Информация успешно добавлена в группу!')),
        );
      });
    }
  }
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  var format = DateFormat('dd.MM.yyyy');
  @override
  Widget build(BuildContext context) {
      return niceContainer(
          child: SizedBox(
              width: 280,
              height: 450,
              child: Scaffold(
                body: Form(
                  key: formKeyInfo,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Информация для группы ${widget.name}', style: subHeaderTxt(size: 24),),
                      SizedBox(height: 16,),
                      Text('Дата следующего занятия: ', style: blockTxt(size: 16),),
                      SizedBox(height: 6,),
                      TextButton(onPressed: (){showDate(context);},
                          child:
                          selectedDate == null ?
                          Text('Выбрать', style: blockTxt(size: 16, color: Color(0xff1372FF)),)
                              : Text(format.format(selectedDate!), style: blockTxt(size: 16, color: Color(0xff1372FF)),)),
                      SizedBox(height: 16,),
                      Text('Начало урока: ', style: blockTxt(size: 16),),
                      SizedBox(height: 6,),
                      TextButton(onPressed: (){showTime(context);},
                          child:
                          selectedTime == null ?
                          Text('Выбрать', style: blockTxt(size: 16, color: Color(0xff1372FF)),)
                              : Text(to24hours(selectedTime!), style: blockTxt(size: 16, color: Color(0xff1372FF)),)),
                      SizedBox(height: 16,),
                      TextFormField(
                        controller: hwController,
                        validator: (v){
                          if (v!.isEmpty){
                            return 'Поле не может быть пустым';
                          }
                        },
                        maxLines: 3,
                        style: blockTxt(),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(

                          hintText: 'Введите домашнее задание',
                          hintStyle: GoogleFonts.manrope(
                              textStyle: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                height: 1.6,
                                color: Color(0xFFA6A6A6),
                              )
                          ),

                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: Color(0xFFC4C4C4),
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: Color(0xFFC4C4C4),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: Color(0xFFC4C4C4),
                              width: 1.0,
                            ),
                          ),
                          hoverColor: Colors.transparent,
                        ),
                      ),
                      SizedBox(height: 16,),
                      button(onClick: (){setInfo(context);}, text: 'Добавить информацию')
                    ],
                  ),
                ),
              )
          ),
          screen: widget.screen
      );

  }
}

setNewInfo(BuildContext context, double screen, String name, String id) async {
  await showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context){
        return Dialog(
          shadowColor: Colors.transparent,
          child: DatePick(screen: screen, name: name, id: id,)
        );
      }
  );
}