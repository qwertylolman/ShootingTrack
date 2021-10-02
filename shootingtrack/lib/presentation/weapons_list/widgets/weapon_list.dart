import 'package:flutter/material.dart';
import 'package:shootingtrack/data/data.dart';
import 'package:shootingtrack/presentation/common/base_state.dart';
import 'package:shootingtrack/presentation/weapons_list/widgets/weapon_item.dart';
import 'package:shootingtrack/presentation/widgets/state_builder.dart';

class WeaponList<T> extends StatelessWidget {
  const WeaponList({
    Key? key,
    required this.state,
  }) : super(key: key);

  final BaseState state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => StateBuilder<T>(
          state,
          data: (T data) => _buildFeed(data as SuccessFeedState),
        )
    );
  }

  Widget _buildFeed(SuccessFeedState success) {
    final int itemsCount = success.items.length;

    itemBuilder(BuildContext context, int index) {
      return _buildItem(success.items[index]);
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: itemsCount,
      itemBuilder: itemBuilder,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 1,
        );
      },
    );
  }

  Widget _buildItem(Object item) {
    if (item is Weapon) {
      return WeaponItem(item);
    }

    throw UnsupportedError("Item of type ${item.runtimeType} is unsupported");
  }
}