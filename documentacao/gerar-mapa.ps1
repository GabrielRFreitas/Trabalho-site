# Gera um PNG para o relatório usando os recursos gráficos do Windows.
# Executar no PowerShell: powershell -File documentacao/gerar-mapa.ps1
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing

$bitmap = New-Object System.Drawing.Bitmap(2400, 1740)
$bitmap.SetResolution(180, 180)
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
$graphics.Clear([System.Drawing.ColorTranslator]::FromHtml('#f5f8fa'))
$resources = New-Object 'System.Collections.Generic.List[System.IDisposable]'

function Brush([string]$color) {
    $brush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml($color))
    $resources.Add($brush)
    return $brush
}

function Text([string]$value, [single]$x, [single]$y, [single]$width, [single]$height, [single]$size, [string]$color = '#243747', [bool]$bold = $false, [bool]$center = $false) {
    $style = if ($bold) { [System.Drawing.FontStyle]::Bold } else { [System.Drawing.FontStyle]::Regular }
    $font = New-Object System.Drawing.Font('Arial', $size, $style, [System.Drawing.GraphicsUnit]::Pixel)
    $format = New-Object System.Drawing.StringFormat
    $format.LineAlignment = [System.Drawing.StringAlignment]::Center
    if ($center) { $format.Alignment = [System.Drawing.StringAlignment]::Center }
    $graphics.DrawString($value, $font, (Brush $color), (New-Object System.Drawing.RectangleF($x, $y, $width, $height)), $format)
    $font.Dispose()
    $format.Dispose()
}

function Box([single]$x, [single]$y, [single]$width, [single]$height, [string]$color) {
    $graphics.FillRectangle((Brush $color), $x, $y, $width, $height)
}

function Line([single]$x1, [single]$y1, [single]$x2, [single]$y2, [string]$color = '#075b89', [bool]$arrows = $false) {
    $pen = New-Object System.Drawing.Pen([System.Drawing.ColorTranslator]::FromHtml($color), 5)
    if ($arrows) {
        $pen.StartCap = [System.Drawing.Drawing2D.LineCap]::ArrowAnchor
        $pen.EndCap = [System.Drawing.Drawing2D.LineCap]::ArrowAnchor
    }
    $graphics.DrawLine($pen, $x1, $y1, $x2, $y2)
    $pen.Dispose()
}

try {
    Box 0 0 2400 18 '#a9470b'
    Text 'EXPLORE BRASIL' 100 65 2200 60 36 '#a9470b' $true
    Text 'Mapa do site' 100 120 2200 100 76 '#124663' $true
    Text 'Uma página inicial, quatro páginas secundárias e os caminhos entre elas.' 100 220 2200 60 31

    Box 930 310 540 150 '#124663'
    Text 'Início' 955 322 490 65 43 '#ffffff' $true $true
    Text 'index.html' 955 387 490 50 29 '#ffffff' $false $true
    Line 1200 467 1200 495 '#075b89' $true

    # Uma linha compartilhada representa o menu que interliga as cinco páginas.
    Line 355 505 2050 505
    $nodes = @(
        @{ X = 100; Title = 'Destinos'; File = 'destinos.html'; Description = 'Praia, serra e natureza' },
        @{ X = 665; Title = 'Roteiros'; File = 'roteiros.html'; Description = 'Sugestões de 3 e 5 dias' },
        @{ X = 1230; Title = 'Dicas'; File = 'dicas.html'; Description = 'Planejamento e cuidados' },
        @{ X = 1795; Title = 'Contato'; File = 'contato.html'; Description = 'Formulário demonstrativo' }
    )
    foreach ($node in $nodes) {
        $centerX = $node.X + 255
        Line $centerX 512 $centerX 568 '#075b89' $true
        Box $node.X 575 510 175 '#ffffff'
        Box $node.X 575 510 7 '#075b89'
        Text $node.Title ($node.X + 20) 595 470 60 41 '#124663' $true $true
        Text $node.File ($node.X + 20) 652 470 40 28 '#075b89' $false $true
        Text $node.Description ($node.X + 20) 696 470 40 25 '#526473' $false $true
    }
    Text 'MENU COMPARTILHADO: cada página permite acessar as outras quatro.' 100 777 2200 65 31 '#075b89' $true $true

    Text 'Links dentro do conteúdo' 100 885 2200 75 44 '#124663' $true
    $rows = @(
        @{ From = 'Início'; To = 'Destinos e Roteiros'; Detail = 'Botões e cartões de praia, serra e natureza.' },
        @{ From = 'Destinos'; To = 'Roteiros'; Detail = 'Links para #praia, #serra e #natureza.' },
        @{ From = 'Roteiros'; To = 'Destinos e Dicas'; Detail = 'Retorno às categorias de Destinos e acesso às dicas.' },
        @{ From = 'Dicas'; To = 'Destinos'; Detail = 'Botão "Ver destinos" ao final da página.' },
        @{ From = 'Contato'; To = 'Roteiros'; Detail = 'Link "Confira os roteiros sugeridos".' }
    )
    $rowY = 980
    foreach ($row in $rows) {
        Box 100 $rowY 2200 108 '#ffffff'
        Text $row.From 130 $rowY 450 108 35 '#124663' $true
        Text '→' 610 $rowY 100 108 47 '#a9470b' $true $true
        Text $row.To 770 ($rowY + 9) 1460 45 33 '#124663' $true
        Text $row.Detail 770 ($rowY + 56) 1460 40 26 '#526473'
        $rowY += 123
    }

    Text 'As setas indicam o sentido dos links. Destinos e Roteiros possuem links de ida e volta.' 100 1610 2200 45 26 '#526473'
    Text 'Link externo no rodapé das cinco páginas: portal Visit Brasil (www.visitbrasil.com).' 100 1660 2200 40 25 '#526473'
    $outputPath = Join-Path $PSScriptRoot 'mapa-do-site.png'
    $bitmap.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)
    Write-Output "Mapa salvo em: $outputPath (2400 x 1740 pixels)."
} finally {
    $graphics.Dispose()
    $bitmap.Dispose()
    foreach ($resource in $resources) { $resource.Dispose() }
}
