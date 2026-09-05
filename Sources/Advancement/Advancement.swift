public import Addition

/// The identity and fixed-width integer kernel for forward movement by a count.
public enum Advancement {}

extension Advancement {

    @inlinable
    public static func reporting<Value: FixedWidthInteger>(
        _ value: Value,
        by count: Value
    ) -> (value: Value, overflow: Bool) {
        Addition.reporting(value, count)
    }

    @inlinable
    public static func exact<Value: FixedWidthInteger>(
        _ value: Value,
        by count: Value
    ) throws(Addition.Error) -> Value {
        try Addition.exact(value, count)
    }

    @inlinable
    public static func saturating<Value: FixedWidthInteger>(
        _ value: Value,
        by count: Value
    ) -> Value {
        Addition.saturating(value, count)
    }
}
