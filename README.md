# Advancement

`Advancement` identifies and implements forward movement by a fixed-width integer
count. Its `reporting`, `exact`, and `saturating` policies delegate to Addition.
Exact failure is `Addition.Error.overflow`.
