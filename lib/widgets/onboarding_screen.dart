class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}



List<OnboardingContent> contents = [
  OnboardingContent(
      title: "", image: 'assets/images/doctor.jpeg', description: 'You health is important to us' ),
  OnboardingContent(title: "", image: "assets/images/drug.jpeg",description: 'What health challenges are you facing today?'),
  OnboardingContent(title: "", image: "assets/images/doc2.jpeg", description: 'Speak with a specialist now?'),
  OnboardingContent(title: "", image: "assets/images/pp.jpeg", description: 'Call the Emergency team '),
];