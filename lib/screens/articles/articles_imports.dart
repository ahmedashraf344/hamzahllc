import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hamzahllc/base/Injection/locator.dart';
import 'package:hamzahllc/base/bloc/generic_cubit/generic_cubit.dart';
import 'package:hamzahllc/constant/app_settings.dart';
import 'package:hamzahllc/models/request/articles_request.dart';
import 'package:hamzahllc/models/response/articles_model.dart';
import 'package:hamzahllc/resources/my_api_keys.dart';
import 'package:hamzahllc/resources/my_routes.dart';
import 'package:hamzahllc/resources/my_styles.dart';
import 'package:hamzahllc/services/alert_service/alert_service.dart';
import 'package:hamzahllc/services/api_rest_service/api_rest_service.dart';
import 'package:hamzahllc/services/local_storage_service/local_storage_service.dart';
import 'package:hamzahllc/widgets/widgets_imports.dart';
import 'package:workmanager/workmanager.dart';

part 'view/articles_screen.dart';
part 'viewmodel/articles_viewmodel.dart';
