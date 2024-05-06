import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hamzahllc/base/Injection/locator.dart';
import 'package:hamzahllc/constant/app_settings.dart';
import 'package:hamzahllc/resources/my_assets.dart';
import 'package:hamzahllc/resources/my_colors.dart';
import 'package:hamzahllc/resources/my_routes.dart';
import 'package:hamzahllc/resources/my_styles.dart';
import 'package:hamzahllc/services/alert_service/alert_service.dart';
import 'package:hamzahllc/services/local_storage_service/local_storage_service.dart';
import 'package:hamzahllc/services/navigation_service/navigation_service.dart';
import 'package:hamzahllc/widgets/widgets_imports.dart';
import 'package:local_auth/local_auth.dart';

part 'view/splash_screen.dart';
part 'view_model/splash_viewmodel.dart';
part 'widgets/splash_dialog.dart';
part 'widgets/splash_error_dialog.dart';
