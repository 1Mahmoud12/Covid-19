


import 'package:covid_19/modules/home_layout.dart';

import '../network/local/Cach_helper.dart';
import 'components.dart';

void signOut(context) {

        CashHelper().clearData('token').then((value) {
          navigateAndEnd(context, const HomeLayout());
        });
      }


