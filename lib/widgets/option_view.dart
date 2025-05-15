import 'package:flutter/material.dart';
import 'package:flutter_quiz_demo/models.dart';
import 'package:latext/latext.dart';

class OptionView extends StatelessWidget {
  final Option option;
  final int index;
  final bool isSelected;
  final VoidCallback onSelect;

  const OptionView({
    super.key,
    required this.option,
    required this.index,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? Colors.indigo : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.indigo : Colors.grey[400]!,
                  width: 2,
                ),
                color:
                    isSelected
                        ? Colors.indigo.withValues(alpha: 0.1)
                        : Colors.transparent,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child:
                  option.isLatex
                      ? LaTexT(
                        equationStyle: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                        laTeXCode: Text(option.latexString ?? option.text),
                      )
                      : option.isImage && option.imageUrl != null
                      ? Image.network(
                        option.imageUrl!,
                        height: 40,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text('Failed to load image');
                        },
                      )
                      : Text(
                        option.text,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
