using System.Collections.Generic;

namespace DQ3SFC.Extensions;

static class CollectionExtensions {
	// Allows collection initialization for Queues
	public static void Add<T>(this Queue<T> queue, T value) {
		queue.Enqueue(value);
	}

	// Allows collection initialization for Stacks
	public static void Add<T>(this Stack<T> stack, T value) {
		stack.Push(value);
	}
}

