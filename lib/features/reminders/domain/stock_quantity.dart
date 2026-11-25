/// Calculates the stock after a dose, without allowing negative stock.
int quantityAfterDose({required int currentQuantity, required int doseAmount}) {
  if (doseAmount < 0) throw ArgumentError.value(doseAmount, 'doseAmount');
  return (currentQuantity - doseAmount).clamp(0, currentQuantity);
}
