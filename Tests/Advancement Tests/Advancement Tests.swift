import Addition
import Advancement
import Testing

@Suite
struct `Advancement checks and saturates movement by a count` {

    @Test
    func `Advancement reports and throws on overflow`() {
        let report = Advancement.reporting(UInt.max, by: 1)
        #expect(report.value == 0)
        #expect(report.overflow)
        #expect(throws: Addition.Error.overflow) {
            try Advancement.exact(UInt.max, by: 1)
        }
    }

    @Test
    func `Exact and saturating advancement handle forward movement`() throws {
        #expect(try Advancement.exact(UInt(4), by: 3) == 7)
        #expect(Advancement.saturating(UInt.max - 1, by: 2) == UInt.max)
    }
}
