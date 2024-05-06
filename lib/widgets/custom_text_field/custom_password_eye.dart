part of "../widgets_imports.dart";

class CustomPasswordEye extends StatelessWidget {
  const CustomPasswordEye({
    super.key,
    this.passwordBloc,
  });

  final GenericCubit<bool>? passwordBloc;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: passwordBloc == null,
      child: BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
        bloc: passwordBloc ?? GenericCubit(false),
        builder: (context, state) {
          return IconButton(
            tooltip: 'show password',
            splashColor: MyColors.grey,
            icon: Icon(
              state.data ? Icons.visibility_off : Icons.visibility,
              color: MyColors.grey,
              size: 20.r,
            ),
            onPressed: () => passwordBloc!.onUpdateData(!state.data),
          );
        },
      ),
    );
  }
}
