(function executorLoop() {
    async function autoSolveHangman() {
        const listwords = listwordsstr.split('|#|').map(word => word.split('|')[0].toLowerCase());

        function getPuzzlePattern() {
            const uls = $('#phrase ul');
            let pattern = '';
            uls.each(function(index) {
                const lis = $(this).find('li');
                let wordPattern = '';
                lis.each(function() {
                    const text = $(this).text().trim().toLowerCase();
                    if (text === '' || $(this).hasClass('hide')) {
                        wordPattern += '_';
                    } else if (text.match(/[a-z]/)) {
                        wordPattern += text;
                    } else {
                        wordPattern += text;
                    }
                });
                pattern += wordPattern;
                if (index < uls.length - 1) pattern += ' ';
            });
            return pattern;
        }

        function findMatchingWord(pattern) {
            const normalizedPattern = pattern.replace(/\s+/g, ' ').trim();
            const patternRegex = new RegExp('^' + normalizedPattern.replace(/_/g, '[a-z]').replace(/\s/g, '\\s') + '$', 'i');

            for (const word of listwords) {
                const normalizedWord = word.replace(/\s+/g, ' ').trim();
                if (normalizedWord.match(patternRegex) && normalizedWord.length === normalizedPattern.length) {
                    let isMatch = true;
                    for (let i = 0; i < normalizedPattern.length; i++) {
                        if (normalizedPattern[i] !== '_' && normalizedPattern[i] !== ' ' && normalizedPattern[i] !== normalizedWord[i]) {
                            isMatch = false;
                            break;
                        }
                    }
                    if (isMatch) return word;
                }
            }

            if (dsid_danghoc.length > 0) {
                const index = dsid_danghoc[0];
                if (index < listwords.length) {
                    return listwords[index];
                }
            }

            return null;
        }

        function clickLetter(letter) {
            const button = $(`.key[data-key="${letter}"]`);
            if (button.length && !button.hasClass('chosen') && !button.hasClass('wrong')) {
                button.click();
                return true;
            }
            return false;
        }

        function inputLetter(letter) {
            if (!dskytudago.includes(letter)) {
                $('#inpfrkeyb').val(letter);
                $('#btninskey').click();
                return true;
            }
            return false;
        }

        function clickOK() {
            $('#btnok').click();
        }

        function wait(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        while (true) {
            const pattern = getPuzzlePattern();
            const currentWord = findMatchingWord(pattern);
            if (!currentWord) break;

            const letters = currentWord.split('').filter(c => /[a-z]/.test(c) && !pattern.includes(c));
            const uniqueLetters = [...new Set(letters)];

            for (let letter of uniqueLetters) {
                if (dskytudago.includes(letter)) continue;
                let success = clickLetter(letter);
                if (!success) success = inputLetter(letter);
                if (success) await wait(600); // Nhanh hơn chút
            }

            const newPattern = getPuzzlePattern();
            const allLettersShown = newPattern.split('').every((c, i) =>
                c === currentWord[i] || c === ' ' || !/[a-z]/.test(c)
            );

            if (allLettersShown) {
                clickOK();
                await wait(1200); // Đủ thời gian chuyển sang từ mới
            } else {
                break;
            }

            if ($('#tumoi').find('img[src="/images/congratulations_you_did_it-1.jpg"]').length) break;
            if (mang === 0) break;
            if (dsid_danghoc.length === 0) break;
        }
    }

    async function loopForever() {
        while (true) {
            try {
                console.log('[AUTO HANGMAN] Running...');
                await autoSolveHangman();
                console.log('[AUTO HANGMAN] Restarting...');
            } catch (err) {
                console.error('[AUTO HANGMAN] Error occurred:', err);
            }
        }
    }

    loopForever();
})();
