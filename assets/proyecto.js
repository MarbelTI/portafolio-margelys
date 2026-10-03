const supabase = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

function esc(str) {
  const div = document.createElement('div');
  div.textContent = str ?? '';
  return div.innerHTML;
}

async function loadDetail() {
  const id = new URLSearchParams(window.location.search).get('id');
  const el = document.getElementById('detail');

  if (!id) {
    el.innerHTML = '<p style="padding-top:24px;">Proyecto no especificado.</p>';
    return;
  }

  const { data, error } = await supabase.from('projects').select('*').eq('id', id).single();

  if (error || !data) {
    el.innerHTML = '<p style="padding-top:24px;">No se encontró el proyecto.</p>';
    return;
  }

  const img = data.image_url ? `<img src="${esc(data.image_url)}" alt="${esc(data.title)}" />` : '';
  const tags = (data.tags || []).map(t => `<span class="tag">${esc(t)}</span>`).join('');

  el.innerHTML = `
    <p class="cell-tag" style="padding-top:24px;">${esc(data.cell_ref || '')}</p>
    <span class="category c-peri">${esc(data.category)}</span>
    <h1 style="font-size:26px; margin:8px 0 14px;">${esc(data.title)}</h1>
    <div class="detail-hero">${img}</div>
    <p style="font-size:14px; line-height:1.7; opacity:0.6; margin:0 0 10px;"><strong style="opacity:0.9;">Problema:</strong> ${esc(data.problem)}</p>
    <p style="font-size:14px; line-height:1.7; opacity:0.8; margin:0 0 18px;"><strong style="opacity:0.9;">Solución:</strong> ${esc(data.result)}</p>
    <div class="tags">${tags}</div>
  `;
}

loadDetail();
