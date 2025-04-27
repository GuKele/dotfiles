python
try:
    import sys
    sys.path.insert(0, '/usr/share/gcc-11.2.0/python')
    from libstdcxx.v6 import register_libstdcxx_printers
    register_libstdcxx_printers(None)
except Exception as e:
    print("Failed to load libstdcxx printers:", e)
end
