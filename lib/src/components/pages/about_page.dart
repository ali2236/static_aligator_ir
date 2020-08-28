import 'dart:async';

import 'package:angular/angular.dart';
import 'package:static_aligator_ir/src/pipes/markdown_pipe.dart';
import 'package:static_aligator_ir/src/services/content_service.dart';

import '../markdown_component.dart';

@Component(
  selector: 'about-page',
  template: '''
  <div class="container">
    <markdown value="{{content | async}}"></markdown>
  </div>
  ''',
  directives: [MarkdownComponent],
  pipes: [commonPipes,MarkdownPipe],
)
class AboutPage implements OnInit{

  Future<String> content;

  final ContentService _contentService;

  AboutPage(this._contentService);

  @override
  void ngOnInit(){
    content =  _contentService.getAboutMd();
  }


}