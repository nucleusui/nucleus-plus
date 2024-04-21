import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';

class PrimaryTextField extends StatefulWidget {
  const PrimaryTextField({
    super.key,
    this.controller,
    this.isPassword = false,
    this.autofocus = false,
    this.labelText,
    this.hintText,
    this.textInputType,
    this.onSubmitied,
    this.validator,
    this.textInputAction,
    this.suffixIcon,
    this.enabled = true,
    this.maxLength,
    this.autovalidateMode,
    this.prefixIcon,
    this.contentPadding,
    this.fillColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.height = 52,
    this.minLines,
    this.maxLines,
    this.initialValue,
    this.onChanged,
    this.suffixPadding = const EdgeInsets.only(top: 13, right: 5),
  });

  final TextEditingController? controller;
  final bool isPassword;
  final bool autofocus;
  final String? labelText;
  final String? hintText;
  final TextInputType? textInputType;
  final Function(String value)? onSubmitied;
  final Function(String value)? validator;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final bool? enabled;
  final int? maxLength;
  final AutovalidateMode? autovalidateMode;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final BorderRadiusGeometry borderRadius;
  final double? height;
  final int? minLines;
  final int? maxLines;
  final String? initialValue;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry suffixPadding;

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  String errorText = '';
  bool isFocus = false;
  bool isError = false;
  bool hidePass = false;
  bool isFirst = true;
  void Function(dynamic)? checkError;

  @override
  void initState() {
    hidePass = widget.isPassword;
    isFocus = widget.autofocus;
    checkError = (value) {
      if (widget.validator != null) {
        if (widget.validator!(value).isNotEmpty) {
          isError = true;
          errorText = widget.validator!(value);
        } else {
          isError = false;
          errorText = widget.validator!(value);
        }
      }
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.fillColor ?? AppColors.getColor(ColorKey.background),
          borderRadius: widget.borderRadius,
          border: widget.fillColor != null
              ? null
              : Border.all(
                  color: isError
                      ? Colors.red
                      : isFocus
                          ? AppColors.getColor(ColorKey.primary70)
                          : AppColors.getColor(ColorKey.grey20),
                ),
          boxShadow: [
            if (isFocus && widget.fillColor == null)
              BoxShadow(
                color: AppColors.getColor(ColorKey.primary30),
                offset: const Offset(0, 0),
                blurRadius: 1,
                spreadRadius: 5,
              ),
          ],
        ),
        child: FocusScope(
          onFocusChange: (focus) {
            if (!isFirst) checkError!(widget.controller?.text);
            if (!focus) setState(() => isFocus = false);
            isFirst = false;
          },
          child: TextFormField(
            key: widget.key,
            initialValue: widget.initialValue,
            minLines: widget.minLines,
            maxLines: hidePass ? 1 : widget.maxLines,
            onTap: () => setState(() => isFocus = true),
            onTapOutside: (event) => setState(() => isFocus = false),
            autofocus: widget.autofocus,
            controller: widget.controller,
            obscureText: hidePass,
            keyboardType: widget.textInputType ?? TextInputType.text,
            onFieldSubmitted: widget.onSubmitied,
            enabled: widget.enabled,
            maxLength: widget.maxLength,
            onChanged: widget.onChanged ??
                (widget.autovalidateMode != AutovalidateMode.disabled
                    ? checkError
                    : null),
            autovalidateMode:
                widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
            textInputAction: widget.textInputAction ?? TextInputAction.next,
            style: AssetStyles.pMd,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: widget.contentPadding ??
                  (widget.labelText == null
                      ? const EdgeInsets.fromLTRB(16, kIsWeb ? 14 : 10, 16, 0)
                      : const EdgeInsets.fromLTRB(16, 4, 16, kIsWeb ? 10 : 5)),
              border: InputBorder.none,
              floatingLabelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.getColor(ColorKey.grey50),
              ),
              counterText: "",
              labelText: widget.labelText,
              labelStyle: AssetStyles.pMd.copyWith(
                color: AppColors.getColor(ColorKey.grey50),
              ),
              prefixIcon: widget.prefixIcon == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(top: 10, right: 5),
                      child: widget.prefixIcon,
                    ),
              hintText: widget.hintText,
              hintStyle: AssetStyles.pMd
                  .copyWith(color: AppColors.getColor(ColorKey.grey50)),
              prefixIconConstraints:
                  const BoxConstraints(minWidth: 0, minHeight: 0),
              suffixIconConstraints:
                  const BoxConstraints(minWidth: 0, minHeight: 0),
              suffixIcon: widget.suffixIcon == null
                  ? null
                  : Padding(
                      padding: widget.suffixPadding,
                      child: widget.suffixIcon,
                    ),
            ),
          ),
        ),
      ),
      Visibility(
        visible: isError ? true : false,
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            errorText,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AssetColors.red,
            ),
          ),
        ),
      ),
    ]);
  }
}
