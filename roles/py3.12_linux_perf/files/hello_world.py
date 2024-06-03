import sys
import sysconfig

def check_perf_support():
    if sys.version_info < (3, 12):
        version = sysconfig.get_python_version()
        raise RuntimeError(f"This is Python {version}, not 3.12 or later")

    if not sysconfig.get_config_var("PY_HAVE_PERF_TRAMPOLINE"):
        raise RuntimeError("Python doesn't support perf on this platform")

    if not sys.is_stack_trampoline_active():
        raise RuntimeError("Did you forget the '-X perf' option?")

    cflags = sysconfig.get_config_var("CONFIGURE_CFLAGS")
    if "-fno-omit-frame-pointer" not in cflags:
        print("Python compiled without the frame pointer", file=sys.stderr)

def foo(n):
    result = 0
    for _ in range(n):
        result += 1
    return result

def bar(n):
    foo(n)

def baz(n):
    bar(n)

if __name__ == "__main__":
    check_perf_support()
    baz(1000000)
