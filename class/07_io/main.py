from text_basic import demo_open_close_and_modes, demo_with_is_recommended
from text_reading import demo_read_methods
from csv_json import demo_csv_write_read_sum, demo_json_dump_load


if __name__=="__main__":
    demo_open_close_and_modes()
    print('-' * 60)

    demo_with_is_recommended()
    print('-' * 60)

    demo_read_methods()
    print('-' * 60)

    demo_csv_write_read_sum()
    print('-' * 60)

    demo_json_dump_load()
