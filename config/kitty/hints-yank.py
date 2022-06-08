import re
import os
import subprocess
import traceback

def mark(text, args, Mark, extra_cli_args, *a):
    # from kittens.tui.loop import debug
    # debug('whatever')
    idx = 1

    for m in re.finditer(r'([0-9a-fA-F]{8}-(?:[0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12})', text):
        start, end = m.span()
        mark_text = text[start:end].replace('\n', '').replace('\0', '')
        yield Mark(idx, start, end, mark_text, {
            'content': mark_text,
        })
        idx += 1


def handle_result(args, data, target_window_id, boss, extra_cli_args, *a):
    content = str(data['groupdicts'][0]['content'])
    # ade97d34-9ddc-469a-af7e-4a3bcec74d39
    # 7aaa2735-eb05-45f6-a682-44098622c8af
    # 89705f7b-b856-4923-8caa-94218bac5127
    subprocess.run(['sh', '-c', f'printf "{content}" | ~/.bin/xc'])
    # try:
    #     cmd = subprocess.Popen([os.getenv('HOME', '')+'/.bin/xc'], stdin=subprocess.PIPE)
    #     cmd.stdin.write(content)
    #     cmd.wait()
    #     debug('Done!')
    # except Exception as e:
    #     debug('exception: ' + str(e))
