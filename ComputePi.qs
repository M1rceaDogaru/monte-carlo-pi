namespace Quantum.MonteCarlo
{
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
	open Microsoft.Quantum.Math;
	open Microsoft.Quantum.Convert;
    
    operation ComputePi (iterations: Int, computePrecision: Int) : Double {
		let refRadius = 0.99999999;
		mutable insideRefCount = 0.0;

        for (i in 1..iterations) {
			let x = RandomReal(computePrecision);
			let y = RandomReal(computePrecision);

			let refX = Sqrt(refRadius - PowD(y, 2.0));
			let refY = Sqrt(refRadius - PowD(x, 2.0));
			if (x < refX and y < refY) {
				set insideRefCount += 1.0;
			}
		}

		return 4.0 * insideRefCount / IntAsDouble(iterations);
    }
}
