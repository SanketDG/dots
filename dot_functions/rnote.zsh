function rnote() {
	bat $(ls ~/play/notes/*.md | shuf -n 1)
}
