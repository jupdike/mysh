#!/usr/bin/env node
// Usage: node collate-cloc.js cloctotals.txt [lang1 lang2 ...]
// Collates multiple cloc tables in a file into one combined table.
// If languages are passed, only those rows are shown (case-insensitive).

const fs = require('fs');

const [, , file, ...filterLangs] = process.argv;
if (!file) {
    console.error('Usage: node collate-cloc.js <cloc-output-file> [lang1 lang2 ...]');
    process.exit(1);
}

const text = fs.readFileSync(file, 'utf8');
const lines = text.split('\n');

const totals = new Map(); // language -> { files, blank, comment, code }
const sepRe = /^-{10,}$/;

for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    if (!/^Language\s+files\s+blank\s+comment\s+code/.test(line)) continue;
    // Skip the separator after the header
    i += 2;
    for (; i < lines.length; i++) {
        const row = lines[i];
        if (sepRe.test(row)) break;
        // Last column is code (integer); split into name + 4 numeric columns from the right.
        const m = row.match(/^(.+?)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s*$/);
        if (!m) continue;
        const name = m[1].trim();
        if (name === 'SUM:') continue;
        const files = +m[2], blank = +m[3], comment = +m[4], code = +m[5];
        const cur = totals.get(name) || { files: 0, blank: 0, comment: 0, code: 0 };
        cur.files += files;
        cur.blank += blank;
        cur.comment += comment;
        cur.code += code;
        totals.set(name, cur);
    }
}

let rows = [...totals.entries()].map(([name, v]) => ({ name, ...v }));

if (filterLangs.length) {
    const wanted = new Set(filterLangs.map(s => s.toLowerCase()));
    rows = rows.filter(r => wanted.has(r.name.toLowerCase()));
}

rows.sort((a, b) => b.code - a.code);

const sum = rows.reduce((a, r) => ({
    files: a.files + r.files,
    blank: a.blank + r.blank,
    comment: a.comment + r.comment,
    code: a.code + r.code,
}), { files: 0, blank: 0, comment: 0, code: 0 });

const nameW = Math.max(8, ...rows.map(r => r.name.length), 'Language'.length, 'SUM:'.length);
const numW = 14;
const pad = (s, w) => String(s).padStart(w);
const padR = (s, w) => String(s).padEnd(w);
const sep = '-'.repeat(nameW + numW * 4);

console.log(sep);
console.log(padR('Language', nameW) + pad('files', numW) + pad('blank', numW) + pad('comment', numW) + pad('code', numW));
console.log(sep);
for (const r of rows) {
    console.log(padR(r.name, nameW) + pad(r.files, numW) + pad(r.blank, numW) + pad(r.comment, numW) + pad(r.code, numW));
}
console.log(sep);
console.log(padR('SUM:', nameW) + pad(sum.files, numW) + pad(sum.blank, numW) + pad(sum.comment, numW) + pad(sum.code, numW));
console.log(sep);
