import re

def mark(text, args, Mark, extra_cli_args, *a):
    idx = 1

    for _, m in enumerate(re.finditer(r'(NC-[0-9]+)', text)):
        start, end = m.span()
        mark_text = text[start:end].replace('\n', '').replace('\0', '')
        yield Mark(idx, start, end, mark_text, {
            'url': f"https://cobaltgp.atlassian.net/browse/{mark_text}",
        })
        idx += 1

    for _, m in enumerate(re.finditer(r'\#([0-9]+)', text)):
        start, end = m.span()
        mark_text = text[start:end].replace('\n', '').replace('\0', '')
        yield Mark(idx, start, end, mark_text, {
            'url': f"https://github.com/bisondev/backend/issues/{mark_text[1:]}",
        })
        idx += 1


def handle_result(args, data, target_window_id, boss, extra_cli_args, *a):
    url = str(data['groupdicts'][0]['url'])
    # with open("/Users/rgyllensva/pipe", 'w') as f:
    #     f.write(url)
    boss.open_url(url)
