using System;

namespace DQ3SFC.Sys;

[Serializable]
public class DataAccessException : Exception {
	public DataAccessException() {
	}

	public DataAccessException(string? message) : base(message) {
	}

	public DataAccessException(string? message, Exception? innerException) : base(message, innerException) {
	}

	//protected DataAccessException(SerializationInfo info, StreamingContext context) : base(info, context) {
	//}
}
}
