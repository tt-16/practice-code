
// webtestView.cpp : CwebtestView ���ʵ��
//

#include "stdafx.h"
#include "webtest.h"

#include "webtestDoc.h"
#include "webtestView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CwebtestView

IMPLEMENT_DYNCREATE(CwebtestView, CHtmlView)

BEGIN_MESSAGE_MAP(CwebtestView, CHtmlView)
	// ��׼��ӡ����
	ON_COMMAND(ID_FILE_PRINT, &CHtmlView::OnFilePrint)
END_MESSAGE_MAP()

// CwebtestView ����/����

CwebtestView::CwebtestView()
{
	// TODO: �ڴ˴���ӹ������

}

CwebtestView::~CwebtestView()
{
}

BOOL CwebtestView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: �ڴ˴�ͨ���޸�
	//  CREATESTRUCT cs ���޸Ĵ��������ʽ

	return CHtmlView::PreCreateWindow(cs);
}

void CwebtestView::OnInitialUpdate()
{
	CHtmlView::OnInitialUpdate();

	//Navigate2(_T("http://www.msdn.microsoft.com/visualc/"),NULL,NULL);
	Navigate2(_T("D:/WORKS/GitRepository/practice-code/mfc-example/webtest/Debug/power.html"),NULL,NULL);
}


// CwebtestView ��ӡ



// CwebtestView ���

#ifdef _DEBUG
void CwebtestView::AssertValid() const
{
	CHtmlView::AssertValid();
}

void CwebtestView::Dump(CDumpContext& dc) const
{
	CHtmlView::Dump(dc);
}

CwebtestDoc* CwebtestView::GetDocument() const // �ǵ��԰汾��������
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CwebtestDoc)));
	return (CwebtestDoc*)m_pDocument;
}
#endif //_DEBUG


// CwebtestView ��Ϣ�������
