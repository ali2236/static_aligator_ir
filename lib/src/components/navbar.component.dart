import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:static_aligator_ir/src/components/pages/about_page.dart';

import '../routing/route_paths.dart';
import 'pages/show_page.dart';

@Component(
  selector: 'nav-bar',
  template: '''
   <nav class="navbar navbar-expand-lg navbar-dark bg-transparent mx-4">
       <a class="navbar-brand" [routerLink]="RoutePaths.index.toUrl()"><h1>Ag!</h1></a>
       <div id="collapseNavbar" class="collapse navbar-collapse">       
       <ul class="navbar-nav ml-auto">
           <li class="nav-item"><a class="nav-link" [routerLink]="RoutePaths.projects.toUrl()" [routerLinkActive]="'active'">Projects</a></li>
           <li class="nav-item"><a class="nav-link" [routerLink]="RoutePaths.animeList.toUrl()" [routerLinkActive]="'active'">Anime</a></li>
           <li class="nav-item"><a class="nav-link" [routerLink]="RoutePaths.moviesList.toUrl()" [routerLinkActive]="'active'">Movies</a></li>
           <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="moreDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">More</a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="moreDropdown">
                  <!--<a class="dropdown-item nav-link" [routerLink]="RoutePaths.services.toUrl()" [routerLinkActive]="'active'">Services</a>-->
                  <a class="dropdown-item nav-link" [routerLink]="RoutePaths.powerPoints.toUrl()" [routerLinkActive]="'active'">PowerPoints</a>
                  <a class="dropdown-item nav-link" [routerLink]="RoutePaths.playgrounds.toUrl()" [routerLinkActive]="'active'">Playgrounds</a>
                  <a class="dropdown-item nav-link" [routerLink]="RoutePaths.about.toUrl()" [routerLinkActive]="'active'">About</a>
              <!--  <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>-->
              </div>
            </li>
       </ul>
       </div>
       <button class="navbar-toggler ml-auto" type="button" data-toggle="collapse" data-target="#collapseNavbar" aria-controls="collapseNavbar" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
       </button>
   </nav>
  ''',
  directives: [
    routerDirectives,
    AnimePage,
    MoviePage,
    AboutPage,
  ],
  exports: [RoutePaths],
)
class Navbar {}
