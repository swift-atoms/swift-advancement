# swift-advancement

Use this package when you move a fixed-width integer position by a count (an index stepped forward, an offset advanced) and must decide what happens when the move leaves the type's range: wrap and report it, fail, or clamp. Start from `Advancement`. When the two operands are symmetric summands rather than a position and a count, use `Addition` from the sibling package swift-addition directly.

## Laws

- Advancing `value` by `count` is exactly `Addition` of `value` and `count`: each of the three `Advancement` forms returns what the matching `Addition` form returns for the same operands, and adds no behaviour of its own.
- The reporting form returns the two's-complement wrapped result and flags overflow; `UInt.max` advanced by 1 reports `0` with overflow set.
- The exact form throws precisely when the reporting form flags overflow, and otherwise returns the same value.
- The saturating form clamps an overflowing move to the type's maximum, except a signed move by a negative count, which clamps to the type's minimum. A move that does not overflow is returned unchanged.
