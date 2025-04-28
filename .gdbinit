# info pretty-printer 查看加载的pretty-printers
# 也可以通过加载auto-load safe-path来加载pretty-printers
python
try:
    import sys
    sys.path.insert(0, '/usr/share/gcc-11.2.0/python')
    from libstdcxx.v6 import register_libstdcxx_printers
    register_libstdcxx_printers(None)
except Exception as e:
    print("Failed to load libstdcxx printers:", e)
end
