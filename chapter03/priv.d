module priv;

// voldemort types
private struct Priv {
    int x,y;
}

Priv makeAPriv(int x, int y) {
    return Priv(x,y);
}

auto makeAPriv2(int x, int y) {
    struct Priv2 {
        int x,y;
    }
    return Priv2(x,y);
}