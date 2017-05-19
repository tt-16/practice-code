// ��� MFC ʾ��Դ������ʾ���ʹ�� MFC Microsoft Office Fluent �û����� 
// ("Fluent UI")����ʾ������Ϊ�ο������ṩ�� 
// ���Բ��䡶Microsoft ������ο����� 
// MFC C++ ������渽����ص����ĵ���
// ���ơ�ʹ�û�ַ� Fluent UI ����������ǵ����ṩ�ġ�
// ��Ҫ�˽��й� Fluent UI ��ɼƻ�����ϸ��Ϣ�������  
// http://msdn.microsoft.com/officeui��
//
// ��Ȩ���� (C) Microsoft Corporation
// ��������Ȩ����

// WebBrowserView.cpp : CWebBrowserView ���ʵ��
//

#include "stdafx.h"
#include "WebBrowserApplication.h"

#include "WebBrowserApplicationDoc.h"
#include "WebBrowserView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CWebBrowserView

IMPLEMENT_DYNCREATE(CWebBrowserView, CHtmlView)

BEGIN_MESSAGE_MAP(CWebBrowserView, CHtmlView)
	// ��׼��ӡ����
	ON_COMMAND(ID_FILE_PRINT, &CHtmlView::OnFilePrint)
END_MESSAGE_MAP()

// CWebBrowserView ����/����

CWebBrowserView::CWebBrowserView()
{
	// TODO: �ڴ˴���ӹ������

}

CWebBrowserView::~CWebBrowserView()
{
}

BOOL CWebBrowserView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: �ڴ˴�ͨ���޸�
	//  CREATESTRUCT cs ���޸Ĵ��������ʽ

	return CHtmlView::PreCreateWindow(cs);
}

void CWebBrowserView::OnInitialUpdate()
{
	CHtmlView::OnInitialUpdate();

	Navigate2(_T("file:///C:/WebBrowserApplication/HtmlData/echarts.html"),NULL,NULL);
}


// CWebBrowserView ��ӡ


void CWebBrowserView::OnFilePrintPreview()
{
	AFXPrintPreview(this);
}


void CWebBrowserView::OnRButtonUp(UINT nFlags, CPoint point)
{
	ClientToScreen(&point);
	OnContextMenu(this, point);
}

void CWebBrowserView::OnContextMenu(CWnd* pWnd, CPoint point)
{
	theApp.GetContextMenuManager()->ShowPopupMenu(IDR_POPUP_EDIT, point.x, point.y, this, TRUE);
}


// CWebBrowserView ���

#ifdef _DEBUG
void CWebBrowserView::AssertValid() const
{
	CHtmlView::AssertValid();
}

void CWebBrowserView::Dump(CDumpContext& dc) const
{
	CHtmlView::Dump(dc);
}

CWebBrowserApplicationDoc* CWebBrowserView::GetDocument() const // �ǵ��԰汾��������
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CWebBrowserApplicationDoc)));
	return (CWebBrowserApplicationDoc*)m_pDocument;
}
#endif //_DEBUG


// CWebBrowserView ��Ϣ�������
