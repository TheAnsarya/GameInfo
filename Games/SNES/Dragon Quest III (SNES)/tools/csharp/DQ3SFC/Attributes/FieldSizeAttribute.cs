using System;

namespace DQ3SFC.Attributes;

[AttributeUsage(AttributeTargets.Field | AttributeTargets.Property | AttributeTargets.Parameter | AttributeTargets.ReturnValue)]
class FieldSizeAttribute : Attribute {
	// The constructor is called when the attribute is set.
	public FieldSizeAttribute(Ima size) {
		fsize = size;
	}

	protected Ima fsize;

	public Ima Size {
		get { return fsize; }
		set { fsize = value; }
	}
}

