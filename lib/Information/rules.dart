import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:safe_travel/Auth/auth.dart';

class RulesView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RulesViewState();
  }
}

class RulesViewState extends State<RulesView> {
  final AuthService _auth = AuthService();

  int currentstep = 0;

  bool complete = false;
  bool reviewFlag = false;
  var rules;

  @override
  void initState() {
    super.initState();
    ReviewService()
        .getLatestRules(
            'THE PROPOSED NATIONAL TRANSPORT AND SAFETY AUTHORITY (OPERATION OF MOTORCYCLES) REGULATIONS, 2014')
        .then((QuerySnapshot docs) {
      if (docs.documents.isNotEmpty) {
        reviewFlag = true;
        rules = docs.documents[0].data;
      }
    });
  }

  next() {
    currentstep + 1 != stStep.length
        ? goTo(currentstep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentstep > 0) {
      goTo(currentstep - 1);
    }
  }

  goTo(int step) {
    setState(() {
      currentstep = step;
    });
  }

  List<Step> stStep = [
    Step(
        title: Container(
            child: Text(
          'THE PROPOSED NATIONAL TRANSPORT AND SAFETY AUTHORITY (OPERATION OF MOTORCYCLES) REGULATIONS, 2014',
          style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade700),
        )),
        subtitle: Text('PART 1: PRELIMINARY'),
        content: Text('Citation: ' +
            '1. These Regulations may be cited as the National Transport and Safety Authority Operation of motorcycles) Regulations, 2014'),
        isActive: true),
    Step(
        title: Text('Responsibilities of Owners'),
        subtitle: Text('PART 2 –TWO WHEELED MOTORCYCLES'),
        content: Container(
            child: Text(
          'Every owner of a two wheeled motorcycle shall – a. Provide the rider and passenger with the protective gear stipulated in Regulation 4(1). b. Not cause or permit any person to ride their motorcycle unless such person is the holder of a valid driving licence or a valid provisional licence endorsed in respect of that class of motorcycle. c. For private motorcycles, ensure that the motorcycle is at the very minimum insured against third party risks in accordance with the Motor Vehicle (Third Party) Insurance Act. d. For two wheeled motorcycle taxi, ensure that motorcycle has a Third Party Public Service Vehicle Insurance. e. Ensure that no structural modifications to the motorcycle are undertaken that may affect the safe operation of the motorcycle. f. Ensure that no structural modifications to the motorcycle are undertaken that may obstruct the visibility of the rear number plates. g. Ensure that no modifications to the exhaust system or any other noise abatement device of a motorcycle are done so as to cause the noise emitted by the motorcycle to be above that emitted by the motorcycle as originally manufactured"',
          style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade700),
        )),
        isActive: true),
    Step(
        title: Text('Responsibilities of a Passenger'),
        subtitle: Text('PART 2 –TWO WHEELED MOTORCYCLES'),
        content: Container(
            child: Text(
          'Every passenger in a motorcycle shall:- a. Properly wear a helmet and reflective jacket whenever being carried on a motorcycle. b. Not board or be carried on a motorcycle that already has a passenger except as provided by Regulation 6(2). c. Not board or be carried on a motorcycle that is carrying any load. d. Sit astride in the seat fixed behind the rider’s seat. ',
          style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade700),
        )),
        isActive: true),
    Step(
        title: Text('Responsibilities of a Rider'),
        subtitle: Text('PART 2 –TWO WHEELED MOTORCYCLES'),
        content: Container(
            child: Text(
          'Every rider of a motorcycle shall – a. Have a valid driving license issued by the Authority. b. Ensure that they shall not ride or carry a person on a motor cycle without the prescribed protective gear properly fastened. c. Not carry more than one person at a time. d. Ensure that passengers are carried on a proper seat with foot rests securely fixed to the motor cycle behind the rider’s seat. e. Ensure that a passenger sits astride the motor cycle. f. Ensure that the headlights of the motorcycle are on at all times when riding. 4 g. Ensure that loads and passengers are not carried at the same time. h. Keep the protective gear in a clean, dry and generally wearable condition. i. Ensure that the rear number plates are visible at all times. j. To overtake on the right hand side and not to overtake in the same lane occupied by vehicle being overtaken. k. To observe traffic lights. l. To observe all traffic rules. m. Not park in undesignated areas. (2) For the purposes of these Regulations:- a. A child less who is less than 12 years old maybe carried together with an adult provided the child is seated between the rider and the adult and wears a helmet designed for children. b. Persons with disabilities will be exempted from the requirement to sit astride while being carried on a motorcycle. ',
          style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade700),
        )),
        isActive: true),
  ];

  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: ListView(children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 21.0, 0.0, 0.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MaterialButton(
                              //minWidth: 40,
                              onPressed: () {
                                Navigator.of(context).pushNamed('/home');
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text('SafeTravel.',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red.shade200,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            MaterialButton(
                              //minWidth: 40,
                              onPressed: () async {
                                await _auth.signout();
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Log Out',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red.shade200,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
                Column(
                  children: <Widget>[
                    Container(
                        child: Stepper(
                      steps: stStep,
                      currentStep: currentstep,
                      type: StepperType.vertical,
                      onStepCancel: cancel,
                      onStepContinue: next,
                      onStepTapped: (step) => goTo(step),
                    )),
                  ],
                )
              ])
        ]));
  }
}

class ReviewService {
  getLatestRules(String admin) {
    return Firestore.instance
        .collection('Users')
        .where('role', isEqualTo: admin)
        .getDocuments();
  }
}
