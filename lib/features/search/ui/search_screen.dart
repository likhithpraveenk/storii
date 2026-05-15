import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/features/search/logic/search_provider.dart';
import 'package:storii/features/search/ui/search_results.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/widgets/empty_state.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();
  String _query = '';
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchAsync = ref.watch(searchProvider(_query));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: true,
        title: Material(
          type: .transparency,
          child: TextField(
            autofocus: true,
            controller: _controller,
            onChanged: (value) {
              _debounce?.cancel();

              _debounce = Timer(const Duration(milliseconds: 500), () {
                setState(() {
                  _query = value;
                });
              });
            },
            decoration: InputDecoration(
              hint: Text(
                l10n.search,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              suffixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        _controller.clear();
                        setState(() {
                          _query = '';
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
      ),
      body: searchAsync.when(
        data: (response) {
          if (response == null || _controller.text.isEmpty) {
            return const EmptyState();
          }
          return Column(
            children: [
              FilterChipsRow(response.filterTabs()),
              Expanded(
                child: SearchResultsView(
                  response,
                  onViewAll: (filter) {
                    ref.read(searchFilterProvider.notifier).set(filter);
                  },
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: RandomWaveform()),
        error: (error, _) => ErrorRetryWidget(
          '$error',
          onRetry: () => ref.invalidate(searchProvider),
        ),
      ),
    );
  }
}

class FilterChipsRow extends ConsumerWidget {
  const FilterChipsRow(this.filterTabs, {super.key});

  final List<SearchFilter> filterTabs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = ref.watch(searchFilterProvider);
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: .horizontal,
        itemCount: filterTabs.length,
        padding: const .symmetric(horizontal: 16),
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final f = filterTabs[i];
          return FilterChip(
            label: Text(f.label),
            selected: active == f,
            onSelected: (_) {
              ref.read(searchFilterProvider.notifier).set(f);
            },
            visualDensity: .compact,
          );
        },
      ),
    );
  }
}
