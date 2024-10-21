class AddProjectSettings {
  double? valueAddedTax;
  List<dynamic>? holidays;

  AddProjectSettings({
    this.valueAddedTax,
    this.holidays,
  });

  Map<String, dynamic> toJson() => {
        'valueAddedTax': valueAddedTax ?? '',
        'holidays': holidays ?? '',
      };
}
