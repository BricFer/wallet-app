import 'package:flutter/material.dart';
import 'package:wallet_app/core/constants/constants.dart';
import 'package:wallet_app/widgets/layout/custom_appbar.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.aboutUsEn),
      body: SingleChildScrollView(
        child: Container(
          padding: AppPaddings.paddingAll16,
          margin: EdgeInsets.all(AppDimens.margin16),
          child: Column(
            spacing: AppDimens.spacing16,
            children: [
              Container(
                height: AppDimens.height245,
                width: AppDimens.width245,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(Strings.imageProfileUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: AppDimens.height24),
              Text(
                'Nunc blandit blandit justo nec feugiat. Fusce consectetur vulputate orci, ac viverra tellus ornare in. Vivamus laoreet finibus metus, sed lobortis ligula aliquam a. Etiam condimentum quam quis velit consequat, vitae pretium sem sollicitudin. Mauris placerat sem sed mi consectetur eleifend. Vestibulum imperdiet mollis feugiat. Quisque sed diam at augue cursus varius id at neque. Sed egestas quis leo faucibus fringilla. Praesent sagittis a eros in pellentesque. Vestibulum orci leo, pharetra nec dolor id, aliquam congue neque.',
                textAlign: TextAlign.justify,
              ),
              Text(
                'Sed convallis, quam eu rutrum iaculis, nisi velit condimentum magna, vitae ultricies est massa sit amet lorem. Suspendisse potenti. Vivamus consequat interdum dolor non auctor. Ut eu ornare sapien. Aliquam porta luctus massa et porta. Phasellus sed scelerisque quam. Vestibulum lobortis urna sit amet urna maximus, sit amet mattis lectus tempor. Duis auctor pulvinar turpis ut consequat. Maecenas sit amet sodales mauris.',
                textAlign: TextAlign.justify,
              ),
              Text(
                'Nunc quis quam aliquam, varius turpis mollis, vulputate magna. Mauris quis odio vel massa consectetur mollis at sed magna. Fusce semper mi est, at condimentum dolor pulvinar nec. Etiam scelerisque nisi mi. Mauris a mi justo. Duis non dui eu sapien faucibus condimentum. Nulla pretium aliquet turpis, in pretium risus commodo sit amet.',
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
