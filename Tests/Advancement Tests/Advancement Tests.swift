import Addition
import Advancement
import Testing

@Suite
struct `Advancement Tests` {

    @Test
    func `reports and throws overflow`() {
        let report = Advancement.reporting(UInt.max, by: 1)
        #expect(report.value == 0)
        #expect(report.overflow)
        #expect(throws: Addition.Error.overflow) {
            try Advancement.exact(UInt.max, by: 1)
        }
    }

    @Test
    func `exact and saturating advance by a count`() throws {
        #expect(try Advancement.exact(UInt(4), by: 3) == 7)
        #expect(Advancement.saturating(UInt.max - 1, by: 2) == UInt.max)
    }
}
