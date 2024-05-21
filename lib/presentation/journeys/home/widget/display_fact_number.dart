import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/layout_constants.dart';
import '../blocs/cubit/home_cubit.dart';
import 'loader_widget.dart';

class DisplayFactNumber extends StatelessWidget {
  const DisplayFactNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(
        ScreenUtil().screenWidth,
        ScreenUtil().screenHeight * 0.5,
      ),
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).appBarTheme.backgroundColor!,
          ),
          borderRadius: BorderRadius.circular(LayoutConstants.radius),
        ),
        child: Center(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const LoaderWidget();
              } else if (state is HomeLoaded) {
                return ListTile(
                  enabled: false,
                  title: Text(
                    state.factNumbers.number.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    state.factNumbers.text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  style: ListTileStyle.list,
                );
              } else if (state is HomeLoadedError) {
                return Text(
                  state.error,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                );
              }
              return Text(
                'Start Searching!',
                style: Theme.of(context).textTheme.bodyLarge,
              );
            },
          ),
        ),
      ),
    );
  }
}
