import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:borebgone/blocs/home_bloc.dart';
import 'package:borebgone/services/boredService.dart';
import 'package:borebgone/services/connectivityService.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<BoredService>(context),
        RepositoryProvider.of<ConnectivityService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Activities for bored people'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeLoadedState) {
              return Column(
                children: [
                  Text(state.activityName),
                  Text(state.activityType),
                  Text(
                    state.participants.toString(),
                  ),
                  ElevatedButton(
                    onPressed: () => BlocProvider.of<HomeBloc>(context).add(LoadApiEvent()),
                    child: Text('LOAD NEXT'),
                  )
                ],
              );
            }
            if (state is HomeNoInternetState) {
              return Text('no internet :(');
            }
            return Container();
          },
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class Home extends StatefulWidget {
//   @override
//   State<Home> createState() => _State();
// }
//
// class _State extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Bor-B-Gone',
//           style: TextStyle(color: Colors.greenAccent),
//         ),
//       ),
//       body: Center(
//         child: Column (
//           children: [
//             Container(
//               width: double.infinity,
//               margin: EdgeInsets.only(top: 30, bottom: ),
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//               height: 120,
//               color: Colors.green.shade700,
//               child: Text(
//                 "Got something that might interest ya!",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 25.0,
//                   fontWeight: FontWeight.bold
//                 ),
//               )
//             ),
//             const CustomSlider(),
//             FloatingActionButton(onPressed: () => {
//               Future<http.Response> () {
//                 return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
//     }
//             })
//           ]
//         )
//       )
//     );
//   }
// }
//
//
// class CustomSlider extends StatefulWidget {
//   const CustomSlider({super.key});
//
//   @override
//   State<CustomSlider> createState() => _CustomSliderState();
// }
//
// class _CustomSliderState extends State<CustomSlider> {
//   RangeValues _currentRangeValues = const RangeValues(0, 20);
//
//   @override
//   Widget build(BuildContext context) {
//     return RangeSlider(
//       values: _currentRangeValues,
//       max: 200,
//       divisions: 5,
//       labels: RangeLabels(
//         _currentRangeValues.start.round().toString(),
//         _currentRangeValues.end.round().toString(),
//       ),
//       onChanged: (RangeValues values) {
//         setState(() {
//           _currentRangeValues = values;
//         });
//       },
//     );
//   }}