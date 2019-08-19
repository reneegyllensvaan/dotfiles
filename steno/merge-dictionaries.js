const basePath = './steno-dictionaries/dictionaries';
const dictionaryList = require('./dictionary-list');

let dict = {};
let maxStrokeLength = 0;

dictionaryList.forEach(name => {
    dictionary = require(basePath + '/' + name);
    Object.entries(dictionary).forEach(([stroke, word]) => {
        maxStrokeLength = Math.max(stroke.length, maxStrokeLength);
        if (dict[stroke] && dict[stroke] !== word) {
            console.warn(`overriding entry ${dict[stroke]} with ${word}. (${stroke})`)
        }
        dict[stroke] = word;
    });
});

// Format JSON manually for better control of formatting
console.log('{');
Object.entries(dict).sort(
    // Sort entries by their word to make sure equivalent strokes are adjacent
    ([stroke1, word1], [stroke2, word2]) => word1.localeCompare(word2)
).forEach(([stroke, word], i, entries) => {
    console.log(
        '    '
        + (`"${stroke}": `).padEnd(maxStrokeLength + 3)
        + `"${word.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}"${i == entries.length - 1 ? '' : ','}`
    )
});
console.log('}');
