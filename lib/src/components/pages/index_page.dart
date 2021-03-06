import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/components/title_card_component.dart';
import 'package:static_aligator_ir/src/models/colors.dart';
import 'package:static_aligator_ir/src/models/page_seo.dart';
import 'package:static_aligator_ir/src/models/pair.dart';

import '../markdown_component.dart';

@Component(
  selector: 'index-page',
  template: '''<div class="container">
    <div class="row">
        <img class="mx-4" [style.background-color]="Colors.background" width="256" height="256" src="/static/upload/images/face.webp"/>
        <div class="ml-4">
            <h1 class="mb-1">Ali "Aligator" Ghanbari</h1>
            <h6>Pure Programmer</h6>
            <a class="btn glowing-button" href="mailto:ali.gh2236@gmail.com">Email Me</a>
        </div>
    </div>
    <section id="about" class="my-5">
      <h2>- About</h2>
      <div class="card">
        <div class="card-text card-text-big p-4"><markdown [value]="aboutText"></markdown></div>
      </div>
    </section>
    <section id="skills" class="my-5">
      <h2>- Skills</h2>
      <div class="row">
        <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3" *ngFor="let skill of skills">
          <title-card [title]="skill"></title-card>
        </div>
      </div>
    </section>
    <section id="interests" class="my-5">
      <h2>- Interests</h2>
      <div class="row">
        <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3" *ngFor="let interest of interests">
        <title-card [title]="interest"></title-card>
        </div>
      </div>
    </section>
    <section id="languages" class="my-5">
      <h2>- Languages</h2>
      <div class="row">
        <div class="col-sm-12 col-md-6 col-lg-4" *ngFor="let language of languages">
        <title-card [title]="language.first" [hover]="language.second"></title-card>
        </div>
      </div>
    </section>
</div>
  ''',
  directives: [MarkdownComponent, coreDirectives, TitleCard],
  exports: [Colors],
)
class IndexPage extends PageSEO{
  final String aboutText = '''
I'm a 20 year old from Iran. I am currently studying Software Engineering at Persian Gulf University.
I love programming and experimenting with new programming ideas.
My favorite programming language is **Dart** (this site is also made using dart).
I have been writing mobile apps for 3 years by now ,but I only published one app called Prayer Times(also written in dart).
I'm also an expert when it comes to PC hardware. I love programming using my desktop computer and use the <span class="strike-through">light theme</span>(not any more) in Intellij IDEs.
  ''';

  final List<String> skills = [
    'Flutter',
    'Unity',
    'Angular',
    'Asp.net core',
  ];

  final List<String> interests = [
    'Programming languages',
    'Dart',
    'Algorithms',
    'Front-end frameworks',
  ];

  final List<Pair<String,String>> languages = [
    Pair('Persian', 'فارسی'),
    Pair('English','English'),
    Pair('Arabic', 'العربیة'),
  ];

  @override
  String get pageTitle => 'Ali \"Aligator\" Ghanbari';

  @override
  String get pageDescription => 'Ali Ghanbari\'s personal site';
}
