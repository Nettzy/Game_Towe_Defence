global.pausado = false;
aberto = false;
dropdown_aberto = false;
ordem_atual = "";

// Grade
colunas = 6;
linhas  = 3;
slot_size = 64;
slot_gap  = 6;

// Tamanho total do painel
painel_w = colunas * (slot_size + slot_gap) + slot_gap + 40;
painel_h = linhas  * (slot_size + slot_gap) + slot_gap + 80;

// Posição centralizada na tela
painel_x = (display_get_gui_width()  - painel_w) / 2;
painel_y = (display_get_gui_height() - painel_h) / 2;

// Itens: [nome, raridade, valor, quantidade]
// raridade: 1=comum, 2=incomum, 3=raro
itens = [];

ordenar_itens = function(_criterio)
{
    switch (ordem_atual)
    {
        case "Peso":     heapsort(itens, "qtd");          break;
        case "Raridade": mergesort(itens, "raridade", 0, array_length(itens) - 1); break;
        case "Valor":    quicksort(itens, "valor_total", 0, array_length(itens) - 1); break;
    }
}

// Quicksort - ordem DECRESCENTE
quicksort = function(_arr, _criterio, _inicio, _fim)
{
    if (_inicio >= _fim) return;
    
    var _pivo = _arr[_fim][$ _criterio];
    var _i = _inicio - 1;
    
    for (var _j = _inicio; _j < _fim; _j++)
    {
        if (_arr[_j][$ _criterio] >= _pivo) // >= para decrescente
        {
            _i++;
            var _temp = _arr[_i];
            _arr[_i] = _arr[_j];
            _arr[_j] = _temp;
        }
    }
    
    var _temp = _arr[_i + 1];
    _arr[_i + 1] = _arr[_fim];
    _arr[_fim] = _temp;
    
    var _pi = _i + 1;
    quicksort(_arr, _criterio, _inicio, _pi - 1);
    quicksort(_arr, _criterio, _pi + 1, _fim);
}

// Mergesort - ordem DECRESCENTE
mergesort = function(_arr, _criterio, _inicio, _fim)
{
    if (_inicio >= _fim) return;
    
    var _meio = (_inicio + _fim) div 2;
    mergesort(_arr, _criterio, _inicio, _meio);
    mergesort(_arr, _criterio, _meio + 1, _fim);
    
    var _esq = array_create(_meio - _inicio + 1);
    var _dir = array_create(_fim - _meio);
    
    for (var _i = 0; _i < array_length(_esq); _i++)
        _esq[_i] = _arr[_inicio + _i];
    for (var _i = 0; _i < array_length(_dir); _i++)
        _dir[_i] = _arr[_meio + 1 + _i];
    
    var _i = 0; var _j = 0; var _k = _inicio;
    
    while (_i < array_length(_esq) && _j < array_length(_dir))
    {
        if (_esq[_i][$ _criterio] >= _dir[_j][$ _criterio]) // >= para decrescente
        {
            _arr[_k] = _esq[_i];
            _i++;
        }
        else
        {
            _arr[_k] = _dir[_j];
            _j++;
        }
        _k++;
    }
    
    while (_i < array_length(_esq)) { _arr[_k] = _esq[_i]; _i++; _k++; }
    while (_j < array_length(_dir)) { _arr[_k] = _dir[_j]; _j++; _k++; }
}

// Heapify - ordem DECRESCENTE (min-heap)
heapify = function(_arr, _n, _i, _criterio)
{
    var _menor = _i;
    var _esq   = 2 * _i + 1;
    var _dir   = 2 * _i + 2;
    
    if (_esq < _n && _arr[_esq][$ _criterio] < _arr[_menor][$ _criterio])
        _menor = _esq;
    if (_dir < _n && _arr[_dir][$ _criterio] < _arr[_menor][$ _criterio])
        _menor = _dir;
    
    if (_menor != _i)
    {
        var _temp      = _arr[_i];
        _arr[_i]       = _arr[_menor];
        _arr[_menor]   = _temp;
        heapify(_arr, _n, _menor, _criterio);
    }
}

// Heapsort - ordem DECRESCENTE
heapsort = function(_arr, _criterio)
{
    var _n = array_length(_arr);
    
    for (var _i = _n div 2 - 1; _i >= 0; _i--)
        heapify(_arr, _n, _i, _criterio);
    
    for (var _i = _n - 1; _i > 0; _i--)
    {
        var _temp = _arr[0];
        _arr[0]   = _arr[_i];
        _arr[_i]  = _temp;
        heapify(_arr, _i, 0, _criterio);
    }
}