
// webtestDoc.h : CwebtestDoc ��Ľӿ�
//


#pragma once


class CwebtestDoc : public CDocument
{
protected: // �������л�����
	CwebtestDoc();
	DECLARE_DYNCREATE(CwebtestDoc)

// ����
public:

// ����
public:

// ��д
public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);

// ʵ��
public:
	virtual ~CwebtestDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// ���ɵ���Ϣӳ�亯��
protected:
	DECLARE_MESSAGE_MAP()
};


