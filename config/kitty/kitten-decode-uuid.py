from kitty.boss import Boss
import sys

def main(args: list[str]) -> str:
    print("hey there")
    return sys.stdin.read()

from kittens.tui.handler import result_handler
@result_handler(type_of_input='screen-ansi', has_ready_notification=True)
def handle_result(args: list[str], stdin_data: str, target_window_id: int, boss: Boss) -> None:
    return "foo"*123
