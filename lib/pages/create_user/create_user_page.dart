import 'package:correct/utils/utils.dart';
import 'package:correct/widgets/elevated_input_field.dart';
import 'package:correct/widgets/responsive_constrained_box.dart';
import 'package:flutter/material.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CenteredConstrainedBox(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              expandedHeight: Style.expandedAppBarHeight,
              backgroundColor: Style.surface,
              flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                "Add student",
                style: Style.title,
              )),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(Style.smallPadding),
                    child: ElevatedInputField(
                      labelText: "Name",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Style.smallPadding),
                    child: ElevatedInputField(
                      labelText: "Group",
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(Style.smallPadding),
                          child: ElevatedInputField(
                            labelText: "ID",
                          ),
                        ),
                        RaisedButton(
                          child: Text("Generate"),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
