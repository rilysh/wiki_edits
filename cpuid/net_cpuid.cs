using System.Runtime.InteropServices;
using System.Runtime.Intrinsics.X86;
using System.Text;

namespace X86CPUID {
    class CPUBrandString {
        public static void Main(string[] args) {
            if (!X86Base.IsSupported) {
                Console.WriteLine("Your CPU does not support CPUID instruction.");
            } else {
                Span<int> raw = stackalloc int[12];
                (raw[0], raw[1], raw[2],  raw[3])  = X86Base.CpuId(unchecked((int)0x80000002), 0);
                (raw[4], raw[5], raw[6],  raw[7])  = X86Base.CpuId(unchecked((int)0x80000003), 0);
                (raw[8], raw[9], raw[10], raw[11]) = X86Base.CpuId(unchecked((int)0x80000004), 0);

                Span<byte> bytes = MemoryMarshal.AsBytes(raw);
                string brand = Encoding.UTF8.GetString(bytes).Trim();
                Console.WriteLine(brand);
            }
        }
    }
}
