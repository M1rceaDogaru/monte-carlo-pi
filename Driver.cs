using System;
using System.Threading.Tasks;
using Microsoft.Quantum.Simulation.Simulators;

namespace Quantum.MonteCarlo
{
    class Driver
    {
        static async Task Main(string[] args)
        {
            using (var qsim = new QuantumSimulator())
            {
                var runs = 10;
                Console.WriteLine($"Please wait while we compute PI for {runs} runs...");

                for (var i = 0; i < runs; i++)
                {
                    var pi = await ComputePi.Run(qsim, 1000000, 35);
                    Console.WriteLine($"Run {i + 1} : {pi}");
                }

                Console.WriteLine("Done");
            }
        }
    }
}