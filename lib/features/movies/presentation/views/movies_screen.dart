import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_appp/core/constant/remote_api.dart';
import 'package:movies_appp/core/service/service_locator.dart';
import 'package:movies_appp/features/movies/presentation/controller/movie_cubit.dart';
import 'package:movies_appp/features/movies/presentation/controller/movie_state.dart';
import 'package:movies_appp/features/movies/presentation/views/dummy.dart';
import 'package:shimmer/shimmer.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieCubit>(
      create: (context) => sl<MovieCubit>()
        ..getTopRatedMovie()  // Correctly calling the cubit methods
        ..getNowPlyingMovie()
        ..getPopularMovie(),
      child: BlocBuilder<MovieCubit, MoviesStates>(
        builder: (context, state) {
          // Handle loading and error states
          if (state.status == MovieStates.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == MovieStates.error) {
            return const Center(child: Text('Error loading movies'));
          }

          // Ensure the movie list is not null before accessing it
          if (state.movie == null || state.movie!.isEmpty) {
            return const Center(child: Text('No movies available'));
          }

          return Scaffold(
            body: ListView.builder(
              itemCount: state.movie!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Center(
                      child: Text(
                        state.movie![index].title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
//SingleChildScrollView(
//               key: const Key('movieScrollView'),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   FadeIn(
//                     duration: const Duration(milliseconds: 500),
//                     child: CarouselSlider(
//                       options: CarouselOptions(
//                         height: 400.0,
//                         viewportFraction: 1.0,
//                         onPageChanged: (index, reason) {},
//                       ),
//                       items: moviesList.map(
//                         (item) {
//                           return GestureDetector(
//                             key: const Key('openMovieMinimalDetail'),
//                             onTap: () {},
//                             child: Stack(
//                               children: [
//                                 ShaderMask(
//                                   shaderCallback: (rect) {
//                                     return const LinearGradient(
//                                       begin: Alignment.topCenter,
//                                       end: Alignment.bottomCenter,
//                                       colors: [
//                                         // fromLTRB
//                                         Colors.transparent,
//                                         Colors.black,
//                                         Colors.black,
//                                         Colors.transparent,
//                                       ],
//                                       stops: [0, 0.3, 0.5, 1],
//                                     ).createShader(
//                                       Rect.fromLTRB(
//                                           0, 0, rect.width, rect.height),
//                                     );
//                                   },
//                                   blendMode: BlendMode.dstIn,
//                                   child: CachedNetworkImage(
//                                     height: 560.0,
//                                     imageUrl: state.movie![0].backdropPath,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                                 Align(
//                                   alignment: Alignment.bottomCenter,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(bottom: 16.0),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             const Icon(
//                                               Icons.circle,
//                                               color: Colors.redAccent,
//                                               size: 16.0,
//                                             ),
//                                             const SizedBox(width: 4.0),
//                                             Text(
//                                               'Now Playing'.toUpperCase(),
//                                               style: const TextStyle(
//                                                 fontSize: 16.0,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(bottom: 16.0),
//                                         child: Text(
//                                           item.title,
//                                           textAlign: TextAlign.center,
//                                           style: const TextStyle(
//                                             fontSize: 24,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ).toList(),
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Popular",
//                           style: GoogleFonts.poppins(
//                             fontSize: 19,
//                             fontWeight: FontWeight.w500,
//                             letterSpacing: 0.15,
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {},
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               children: const [
//                                 Text('See More'),
//                                 Icon(
//                                   Icons.arrow_forward_ios,
//                                   size: 16.0,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   FadeIn(
//                     duration: const Duration(milliseconds: 500),
//                     child: SizedBox(
//                       height: 170.0,
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         itemCount: moviesList.length,
//                         itemBuilder: (context, index) {
//                           final movie = moviesList[index];
//                           return Container(
//                             padding: const EdgeInsets.only(right: 8.0),
//                             child: InkWell(
//                               onTap: () {},
//                               child: ClipRRect(
//                                 borderRadius: const BorderRadius.all(
//                                     Radius.circular(8.0)),
//                                 child: CachedNetworkImage(
//                                   width: 120.0,
//                                   fit: BoxFit.cover,
//                                   imageUrl:
//                                       AppConstant.imageUrl(movie.backdropPath),
//                                   placeholder: (context, url) =>
//                                       Shimmer.fromColors(
//                                     baseColor: Colors.grey[850]!,
//                                     highlightColor: Colors.grey[800]!,
//                                     child: Container(
//                                       height: 170.0,
//                                       width: 120.0,
//                                       decoration: BoxDecoration(
//                                         color: Colors.black,
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                       ),
//                                     ),
//                                   ),
//                                   errorWidget: (context, url, error) =>
//                                       const Icon(Icons.error),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.fromLTRB(
//                       16.0,
//                       24.0,
//                       16.0,
//                       8.0,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Top Rated",
//                           style: GoogleFonts.poppins(
//                             fontSize: 19,
//                             fontWeight: FontWeight.w500,
//                             letterSpacing: 0.15,
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {},
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               children: const [
//                                 Text('See More'),
//                                 Icon(
//                                   Icons.arrow_forward_ios,
//                                   size: 16.0,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   FadeIn(
//                     duration: const Duration(milliseconds: 500),
//                     child: SizedBox(
//                       height: 170.0,
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         itemCount: moviesList.length,
//                         itemBuilder: (context, index) {
//                           final movie = moviesList[index];
//                           return Container(
//                             padding: const EdgeInsets.only(right: 8.0),
//                             child: InkWell(
//                               onTap: () {},
//                               child: ClipRRect(
//                                 borderRadius: const BorderRadius.all(
//                                     Radius.circular(8.0)),
//                                 child: CachedNetworkImage(
//                                   width: 120.0,
//                                   fit: BoxFit.cover,
//                                   imageUrl:
//                                       AppConstant.imageUrl(movie.backdropPath),
//                                   placeholder: (context, url) =>
//                                       Shimmer.fromColors(
//                                     baseColor: Colors.grey[850]!,
//                                     highlightColor: Colors.grey[800]!,
//                                     child: Container(
//                                       height: 170.0,
//                                       width: 120.0,
//                                       decoration: BoxDecoration(
//                                         color: Colors.black,
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                       ),
//                                     ),
//                                   ),
//                                   errorWidget: (context, url, error) =>
//                                       const Icon(Icons.error),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 50.0),
//                 ],
//               ),
//             )
