import 'dart:convert';

import 'package:appifylab_test/constants/app_colors.dart';
import 'package:appifylab_test/screens/home_screen/home_screen_model.dart';
import 'package:appifylab_test/screens/home_screen/question_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart' as rootBundle;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<QuestionModel> questions = [];

  int currentQuestionIndex = 0;

  int? selectedOptionIndex;
  Set<int> selectedOptions = {};
  bool isSubmitted = false;


  // Future<List<QuestionModel>> getQuestionData() async {
  //   final response = await rootBundle.rootBundle
  //       .loadString("assets/languages/question_list.json");

  //   final data = json.decode(response) as List<dynamic>;
  //   final questions = data.map((e) => QuestionModel.fromJson(e)).toList();
  //   return questions;
  // }

  Future<void> getQuestionData() async {
    final response = await rootBundle.rootBundle
        .loadString("assets/languages/question_list.json");

    final data = json.decode(response) as List<dynamic>;
    setState(() {
      questions = data.map((e) => QuestionModel.fromJson(e)).toList();
    });
  }
  

  void submitAnswer() async {
    setState(() {
      isSubmitted = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOptionIndex = null;
        selectedOptions.clear();
        isSubmitted = false;
      });
    } else if (currentQuestionIndex == questions.length - 1) {
      setState(() {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                "Successfully Done!",
                style: TextStyle(
                    color: ColorCode.appColor, fontWeight: FontWeight.bold),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: ColorCode.appColor),
                  ),
                ),
              ],
            );
          },
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getQuestionData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                //   if (currentQuestionIndex > 0) {
                //   setState(() {
                //     currentQuestionIndex--;
                //   });
                // } else {
                //   Navigator.pop(context);
                // }
              },
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: ColorCode.whiteColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: ColorCode.blackColor,
                ),
              ),
            ),
            title: const Text(
              "Quizzzz",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          body: questions.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: ColorCode.appColor,
                  ),
                )
              : ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    final question = questions[index];
                    return index == currentQuestionIndex
                        ? Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  question.title ?? "Question is not defined!",
                                  style: const TextStyle(
                                    fontSize: 24,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  question.quizType == 'SINGLE'
                                      ? "Choose only one answer"
                                      : "Can choose multiple answers",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic),
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: question.options!.length,
                                          itemBuilder: (context, optionsIndex) {
                                            final option =
                                                question.options![optionsIndex];
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  //selectedOptionIndex = optionsIndex;
                                                  if (question.quizType ==
                                                      'MULTIPLE') {
                                                    if (selectedOptions
                                                        .contains(
                                                            optionsIndex)) {
                                                      selectedOptions
                                                          .remove(optionsIndex);
                                                    } else {
                                                      selectedOptions
                                                          .add(optionsIndex);
                                                    }
                                                  } else {
                                                    selectedOptionIndex =
                                                        optionsIndex;
                                                  }
                                                });
                                              },
                                              child: Option(
                                                questionOption: option,
                                                optionNo: (optionsIndex + 1)
                                                    .toString(),
                                                answer: option.isRight ?? false,
                                                selectedOption:
                                                    selectedOptionIndex ?? -1,
                                                selectedOptions:
                                                    selectedOptions,
                                                isSelected: questions[
                                                                currentQuestionIndex]
                                                            .quizType ==
                                                        'MULTIPLE'
                                                    ? selectedOptions
                                                        .contains(optionsIndex)
                                                    : selectedOptionIndex ==
                                                        optionsIndex,
                                                onTap: () => (optionsIndex),
                                                submitDone: isSubmitted,
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 210,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        submitAnswer();
                                      },
                                      child: Container(
                                        width: 366,
                                        height: 48,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: ColorCode.appColor,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Text(
                                          question.nextButton == false
                                              ? "Submit"
                                              : "Next",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: ColorCode.whiteColor,
                                            fontSize: 18,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : const SizedBox.shrink(child: Text("No questions!"),);
                  })),
    );
  }
}

class Option extends StatefulWidget {
  const Option({
    super.key,
    required this.questionOption,
    required this.optionNo,
    required this.answer,
    required this.selectedOptions,
    required this.selectedOption,
    required this.onTap,
    required this.isSelected,
    required this.submitDone,
  });

  final Options questionOption;
  final String optionNo;
  final bool answer;
  final int selectedOption; //1 2 3
  final Set<int> selectedOptions;
  final bool isSelected;
  final VoidCallback onTap;
  final bool submitDone;

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  Color borderColor = Colors.grey;
  Color backgroundColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    bool inSelected =
        widget.selectedOptions.contains(int.parse(widget.optionNo));

    bool isCorrectAnswer = widget.questionOption.isRight ?? false;
    bool isUserAnswerCorrect = widget.isSelected && isCorrectAnswer;

    print(widget.submitDone);

    
  

    //bool isSelectedForOneOption = optionNo == (selectedOption + 1).toString();
        // if(widget.submitDone){
        //   setState(() {
        //   borderColor = widget.isSelected
        // ? isUserAnswerCorrect
        //     ? Colors.green
        //     : Colors.red
        // : Colors.grey;
            
        //   });
        // }
        // else{
        //   setState(() {
            
        // borderColor = widget.isSelected
        // ? isUserAnswerCorrect
        //     ? Colors.green
        //     : Colors.red
        // : Colors.grey;
        //   });
        // }
    // Color borderColor = widget.isSelected
    //     ? isUserAnswerCorrect
    //         ? Colors.green
    //         : Colors.red
    //     : Colors.grey;

    // Color backgroundColor = widget.isSelected
    //     ? isUserAnswerCorrect
    //         ? Colors.green
    //         : Colors.red
    //     : Colors.grey;

    // if (widget.submitDone) {
    //   if (widget.isSelected) {
    //     borderColor = isUserAnswerCorrect ? Colors.green : Colors.red;
    //     backgroundColor = isUserAnswerCorrect
    //         ? Colors.green.withOpacity(0.3)
    //         : Colors.red.withOpacity(0.3);
    //   }
    //   if (!widget.isSelected &&
    //       widget.selectedOptions.contains(int.parse(widget.optionNo))) {
    //     borderColor = isCorrectAnswer ? Colors.green : Colors.red;
    //     backgroundColor = isCorrectAnswer
    //         ? Colors.green.withOpacity(0.3)
    //         : Colors.red.withOpacity(0.3);
    //   }
    // } else {
    //   if (widget.isSelected) {
    //     borderColor = Colors.amber;
    //     backgroundColor = Colors.amber.withOpacity(0.3);
    //   } else {
    //     borderColor = Colors.grey;
    //     backgroundColor = Colors.grey;
    //   }
    // }
    

    return Column(
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.isSelected ? Colors.amber : borderColor,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              Container(
                height: double.maxFinite,
                width: 50,
                color: widget.isSelected ? Colors.amber : backgroundColor,
                child: Center(
                    child: Text(
                  widget.optionNo,
                  style: const TextStyle(fontSize: 20),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  widget.questionOption.value ?? "No Option",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
