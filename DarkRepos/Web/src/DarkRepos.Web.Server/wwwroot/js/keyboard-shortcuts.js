/**
 * Keyboard shortcuts module for Dark Repos
 * Provides global keyboard navigation and shortcuts
 */

(function () {
	'use strict';

	// Track registered shortcuts
	const shortcuts = new Map();
	let searchModalCallback = null;

	/**
	 * Register a keyboard shortcut
	 * @param {string} key - The key to listen for
	 * @param {Function} callback - Function to execute
	 * @param {Object} options - Optional settings
	 */
	function registerShortcut(key, callback, options = {}) {
		shortcuts.set(key.toLowerCase(), {
			callback,
			ctrl: options.ctrl || false,
			alt: options.alt || false,
			shift: options.shift || false,
			preventDefault: options.preventDefault !== false
		});
	}

	/**
	 * Set the search modal callback for "/" shortcut
	 * @param {Function} callback - Function to open search
	 */
	function setSearchCallback(callback) {
		searchModalCallback = callback;
	}

	/**
	 * Check if user is typing in an input element
	 * @param {Element} target - Event target
	 * @returns {boolean}
	 */
	function isInputElement(target) {
		const tagName = target.tagName.toLowerCase();
		return (
			tagName === 'input' ||
			tagName === 'textarea' ||
			tagName === 'select' ||
			target.isContentEditable
		);
	}

	/**
	 * Handle keydown events
	 * @param {KeyboardEvent} event
	 */
	function handleKeyDown(event) {
		// Don't trigger shortcuts when typing in inputs
		if (isInputElement(event.target)) {
			// Allow Escape to blur inputs
			if (event.key === 'Escape') {
				event.target.blur();
			}
			return;
		}

		const key = event.key.toLowerCase();

		// Check for "/" to open search (special case)
		if (key === '/' && searchModalCallback && !event.ctrlKey && !event.altKey) {
			event.preventDefault();
			searchModalCallback();
			return;
		}

		// Check registered shortcuts
		const shortcut = shortcuts.get(key);
		if (shortcut) {
			const modifiersMatch = (
				shortcut.ctrl === event.ctrlKey &&
				shortcut.alt === event.altKey &&
				shortcut.shift === event.shiftKey
			);

			if (modifiersMatch) {
				if (shortcut.preventDefault) {
					event.preventDefault();
				}
				shortcut.callback(event);
			}
		}

		// Built-in shortcuts
		switch (key) {
			case 'escape':
				// Close any open modals
				const modal = document.querySelector('.modal.show, .search-modal.show');
				if (modal) {
					event.preventDefault();
					const closeButton = modal.querySelector('[data-dismiss="modal"], .close-button');
					if (closeButton) {
						closeButton.click();
					}
				}
				break;

			case 'g':
				// "g" followed by another key for navigation (vim-style)
				// This would require state tracking for multi-key shortcuts
				break;
		}
	}

	/**
	 * Show keyboard shortcuts help
	 */
	function showHelp() {
		const helpHtml = `
			<div class="shortcuts-help">
				<h3>Keyboard Shortcuts</h3>
				<dl>
					<dt><kbd>/</kbd></dt>
					<dd>Open search</dd>

					<dt><kbd>Esc</kbd></dt>
					<dd>Close modal / Clear focus</dd>

					<dt><kbd>?</kbd></dt>
					<dd>Show this help</dd>
				</dl>
			</div>
		`;
		console.log('Keyboard Shortcuts:', {
			'/': 'Open search',
			'Esc': 'Close modal / Clear focus',
			'?': 'Show this help'
		});
	}

	// Initialize
	function init() {
		document.addEventListener('keydown', handleKeyDown);

		// Register "?" for help
		registerShortcut('?', showHelp, { shift: true });

		console.log('Keyboard shortcuts initialized. Press ? for help.');
	}

	// Export API
	window.DarkReposKeyboard = {
		registerShortcut,
		setSearchCallback,
		showHelp
	};

	// Auto-initialize when DOM is ready
	if (document.readyState === 'loading') {
		document.addEventListener('DOMContentLoaded', init);
	} else {
		init();
	}
})();
